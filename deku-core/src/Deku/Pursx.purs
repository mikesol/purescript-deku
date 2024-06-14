module Deku.Pursx
  ( Attributable
  , AttributableE
  , PursxInfo(..)
  , class Pursx
  , purs
  , pursx2
  , x
  , PursxInfoMap
  ) where

import Prelude

import Control.Monad.ST (ST, run)
import Control.Monad.ST.Ref as STRef
import Data.Either (Either(..))
import Data.Exists (Exists, mkExists, runExists)
import Data.List (List(..), (:))
import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple (uncurry)
import Deku.Core (Attribute, Nut, attributeAtYourOwnRisk, elementify, text_)
import FRP.Poll (Poll)
import Foreign.Object (Object, toUnfoldable)
import Foreign.Object as Object
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

type PursxInfoMap = Map String (Either AttributableE Nut)
data PursxInfo = PursxInfo String PursxInfoMap

instance Semigroup PursxInfo where
  append (PursxInfo a1 b1) (PursxInfo a2 b2) = PursxInfo (a1 <> a2)
    (Map.union b1 b2)

instance Monoid PursxInfo where
  mempty = PursxInfo mempty Map.empty

class Pursx a b | a -> b where
  pursx2 :: a -> Int -> PursxInfo -> b

instance Pursx Unit PursxInfo where
  pursx2 _ _ info = info

instance (Pursx b c) => Pursx String (b -> c) where
  pursx2 str i (PursxInfo html atts'elts) = \m -> pursx2 m i
    (PursxInfo (html <> str) atts'elts)

instance (Pursx b c) => Pursx (Poll (Attribute r)) (b -> c) where
  pursx2 att i (PursxInfo html atts'elts) = \m ->
    pursx2 m
      (i + 1)
      $ PursxInfo (html <> " data-pursx-att=\"" <> show i <> "\" ")
      $ Map.insert (show i) (Left (mkExists (Attributable att))) atts'elts

instance (Pursx b c) => Pursx Nut (b -> c) where
  pursx2 elt i (PursxInfo html atts'elts) = \m ->
    pursx2 m
      (i + 1)
      $ PursxInfo
          (html <> "<pursx data-pursx-elt=\"" <> show i <> "\"></pursx>")
      $ Map.insert (show i) (Right elt) atts'elts

x :: forall a b. Pursx a b => a -> b
x i = pursx2 i 0 mempty

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
