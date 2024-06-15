module Deku.Pursx
  ( Attributable
  , AttributableE
  , PursxAllowable
  , PursxInfo(..)
  , PursxInfoMap
  , class PursxSubstitutions
  , class PursxableToMap
  , class PursxableToMapRL
  , pursxableToMap
  , pursxableToMapRL
  , lenientPursx'
  , lenientPursx
  , pursx'
  , pursx
  ) where

import Prelude

import Control.Monad.ST (ST, run)
import Control.Monad.ST.Ref as STRef
import Data.Either (Either(..), isLeft, isRight)
import Data.Exists (Exists, mkExists, runExists)
import Data.FoldableWithIndex (foldlWithIndex)
import Data.List (List(..), (:))
import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple (uncurry)
import Deku.Core (Attribute, Nut, attributeAtYourOwnRisk, elementify, text_)
import Deku.PursxParser as PxP
import Deku.PxTypes (PxAtt, PxNut)
import FRP.Poll (Poll)
import Foreign.Object (Object, toUnfoldable)
import Foreign.Object as Object
import Prim.Row as Row
import Prim.RowList as RL
import Record as Record
import Type.Equality (class TypeEquals, to)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

data Htmlparser2

foreign import createParser
  :: forall r
   . (String -> Object String -> ST r Unit)
  -> (String -> ST r Unit)
  -> (String -> ST r Unit)
  -> ST r Htmlparser2

foreign import write :: forall r. Htmlparser2 -> String -> ST r Unit

foreign import end :: forall r. Htmlparser2 -> ST r Unit

newtype Attributable r = Attributable (Poll (Attribute r))

unsafeCastAttributable :: forall a b. Attributable a -> Attributable b
unsafeCastAttributable = unsafeCoerce

unAttribuable :: forall x. Attributable x -> Poll (Attribute x)
unAttribuable (Attributable y) = y

type AttributableE = Exists Attributable

type PursxAllowable = Either AttributableE Nut

type PursxInfoMap = Map String PursxAllowable
data PursxInfo = PursxInfo String PursxInfoMap

instance Semigroup PursxInfo where
  append (PursxInfo a1 b1) (PursxInfo a2 b2) = PursxInfo (a1 <> a2)
    (Map.union b1 b2)

instance Monoid PursxInfo where
  mempty = PursxInfo mempty Map.empty

xa :: forall r. Poll (Attribute r) -> AttributableE
xa a = mkExists (Attributable a)

useExistingAtt
  :: forall e. PursxInfoMap -> String -> String -> Poll (Attribute e)
useExistingAtt mp k v = fromMaybe (pure $ attributeAtYourOwnRisk k v) z
  where
  z
    | k == "data-pursx-att" = case Map.lookup v mp of
        Just (Left o) -> Just $ unAttribuable $ runExists unsafeCastAttributable
          o
        _ -> Nothing
    | otherwise = Nothing

onOpenTag
  :: forall r
   . PursxInfoMap
  -> STRef.STRef r (List (Array Nut -> Nut))
  -> String
  -> Object String
  -> ST r Unit
onOpenTag info stack name attributes = do
  stackValue <- STRef.read stack
  let
    backup = elementify Nothing name
      ( map (uncurry (useExistingAtt info)) $ toUnfoldable
          attributes
      )
    nut
      | name == "pursx" = case (Object.lookup "data-pursx-elt" attributes) of
          Just v -> case Map.lookup v info of
            Just (Right n) -> pure n
            _ -> backup
          _ -> backup
      | otherwise = backup
  void $ STRef.write
    (nut : stackValue)
    stack

onText
  :: forall r
   . PursxInfoMap
  -> STRef.STRef r (List (Array Nut -> Nut))
  -> String
  -> ST r Unit
onText _ stack text = do
  stackValue <- STRef.read stack
  void $ case stackValue of
    Nil -> STRef.write (pure (pure nut)) stack
    f : rest -> do
      STRef.write ((\i -> f ([ nut ] <> i)) : rest) stack
  where
  nut = text_ text

onCloseTag
  :: forall r
   . PursxInfoMap
  -> STRef.STRef r (List (Array Nut -> Nut))
  -> String
  -> ST r Unit
onCloseTag _ stack _ = do
  stackValue <- STRef.read stack
  void $ case stackValue of
    -- uh oh
    Nil -> pure unit
    -- fine, we're done
    _ : Nil -> pure unit
    f : g : rest -> do
      void $ STRef.write ((\i -> g ([ f [] ] <> i)) : rest) stack

purs :: PursxInfo -> Nut
purs (PursxInfo html i) = run do
  r <- STRef.new Nil
  parser <- createParser (onOpenTag i r) (onText i r) (onCloseTag i r)
  write parser html
  end parser
  o <- STRef.read r
  pure $ case o of
    Nil -> mempty
    f : _ -> f []

-- delimiter -- str -- split
foreign import splitOnDelimiter :: String -> String -> Array String

class PursxableToMap r where
  pursxableToMap :: { | r } -> Map String PursxAllowable

instance (RL.RowToList r rl, PursxableToMapRL rl r) => PursxableToMap r where
  pursxableToMap = pursxableToMapRL (Proxy :: _ rl)

class PursxableToMapRL (rl :: RL.RowList Type) r where
  pursxableToMapRL :: Proxy rl -> { | r } -> Map String PursxAllowable

instance PursxableToMapRL RL.Nil r where
  pursxableToMapRL _ _ = Map.empty

instance
  ( Row.Cons k Nut r' r
  , IsSymbol k
  , PursxableToMapRL rest r
  ) =>
  PursxableToMapRL (RL.Cons k Nut rest) r where
  pursxableToMapRL _ r = Map.insert (reflectSymbol (Proxy :: _ k))
    (Right (Record.get (Proxy :: _ k) r))
    (pursxableToMapRL (Proxy :: _ rest) r)
else instance
  ( TypeEquals z (Poll (Attribute q))
  , Row.Cons k z r' r
  , IsSymbol k
  , PursxableToMapRL rest r
  ) =>
  PursxableToMapRL (RL.Cons k z rest) r where
  pursxableToMapRL _ r = Map.insert (reflectSymbol (Proxy :: _ k))
    (Left (xa (to ((Record.get (Proxy :: _ k) r) :: z))))
    (pursxableToMapRL (Proxy :: _ rest) r)
lenientPursx'
  :: forall r. PursxableToMap r => String -> String -> { | r } -> Nut
lenientPursx' verb html r = purs $ PursxInfo htmlified mapified
  where
  split = splitOnDelimiter verb html
  ibab i b a =
    if i `mod` 2 == 0 then b <> a
    else if (isLeft <$> Map.lookup a mapified) == Just true then b
      <> " data-pursx-att=\""
      <> a
      <> "\" "
    else if (isRight <$> Map.lookup a mapified) == Just true then b
      <> "<pursx data-pursx-elt=\""
      <> a
      <> "\"></pursx>"
    else b
  htmlified = foldlWithIndex ibab "" split
  mapified = pursxableToMap r

lenientPursx :: forall r. PursxableToMap r => String -> { | r } -> Nut
lenientPursx = lenientPursx' "~"

-- strict
class PursxSubstitutions
  :: RL.RowList Type -> Row Type -> Constraint
class PursxSubstitutions nostr str | nostr -> str

instance PursxSubstitutions RL.Nil ()

instance
  ( Row.Cons k Nut d r
  , PursxSubstitutions c d
  ) =>
  PursxSubstitutions (RL.Cons k PxNut c) r

instance
  ( Row.Cons k (Poll (Attribute q)) d r
  , PursxSubstitutions c d
  ) =>
  PursxSubstitutions (RL.Cons k PxAtt c)
    r

pursx'
  :: forall @verb (@html :: Symbol) r0 rl0 p r rl
   . IsSymbol html
  => IsSymbol verb
  => PxP.PXStart verb " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => PursxSubstitutions rl0 r
  => PursxableToMap r
  => { | r }
  -> Nut
pursx' = lenientPursx' (reflectSymbol (Proxy :: _ verb))
  (reflectSymbol (Proxy :: _ html))

pursx
  :: forall (@html :: Symbol) r0 rl0 p r rl
   . IsSymbol html
  => PxP.PXStart "~" " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => PursxSubstitutions rl0 r
  => PursxableToMap r
  => { | r }
  -> Nut
pursx = lenientPursx' "~" (reflectSymbol (Proxy :: _ html))
