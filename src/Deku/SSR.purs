module Deku.SSR where

import Prelude

import Control.Monad.ST (ST)
import Control.Monad.State (lift)
import Control.Monad.Writer (execWriter, execWriterT, tell)
import Data.Array (drop, findMap, head, take, uncons)
import Data.Array.ST as STA
import Data.FoldableWithIndex (foldrWithIndex, traverseWithIndex_)
import Data.Map (SemigroupMap(..))
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (unwrap)
import Data.String as String
import Data.Traversable (fold, for_, intercalate, traverse)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Debug (spy)
import Deku.Interpret (FFIDOMSnapshot(..), SSRElement(..), SSRText, StateUnit(..))
import Deku.STObject (freezeObj)
import Foreign.Object (Object)
import Foreign.Object as Object
import Foreign.Object.ST as STO

-- | Algorithm
-- | Input: state
-- | Output: string
-- | 1. Find body, this is our toplevel
-- | 2. Find all elements whose parent is _not_ in the units cache. These are inserted into pursx
-- | 3. Render all elements from step2
-- | 4. Perform inerts into the DOM

foreign import encodedString :: String -> String

render
  :: forall r
   . Map.Map String (Array String)
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> String
  -> ST r String
render parentCache state'@(FFIDOMSnapshot state) id = do
  ut <- STO.peek id state.units
  ut # maybe (pure "") \ut' -> do
    case ut' of
      SElement e -> case e.main of
        SSRElement { attributes, tag } -> do
          atts <- STA.freeze attributes
          let
            head = "<" <> tag <> " "
              <> intercalate " "
                ( map (\{ key, value } -> key <> "\"" <> value <> "\"")
                    atts
                )
              <> " data-deku-ssr-"
              <> id
              <> "=\"true\">"
          let
            tail = "</"
              <> tag
              <> ">"
          let kids = fromMaybe [] (Map.lookup id parentCache)
          innerMatter <- fold <$>
            ((traverse (render parentCache state') kids) :: ST r (Array String))
          pure $ (head <> innerMatter <> tail)
        SSRPursxElement { html } -> do
          let spl = String.split (String.Pattern ">") html
          pure $ fold (take 1 spl) <> " data-deku-ssr-"
            <> id
            <> "=\"true\">"
            <> intercalate ">" (drop 1 spl)

      SText e -> pure
        ("<!--" <> id <> "-->" <> encodedString (unwrap e.main).text)
      SComment e -> pure
        ("<!--" <> encodedString (unwrap e.main).text <> "-->")
      SDyn { bookends, children } -> fold <$>
        (traverse (render parentCache state') ([bookends.top] <> children <> [bookends.bot]))
      SEnvy { bookends, child } -> fold <$>
        (traverse (render parentCache state') ([bookends.top] <> maybe [] pure child <> [bookends.bot]))
      SFixed { bookends, children } -> fold <$>
        (traverse (render parentCache state') ([bookends.top] <> children <> [bookends.bot]))

doReplacements :: String -> (String /\ String /\ String) -> String
doReplacements dom (par /\ _ /\ subdom) = do
  -- let _ = spy "doReplacements" [par, id, dom, subdom, show nw]
  fromMaybe dom nw
  where
  nw = do
    let dde = ("data-deku-elt-internal=\"" <> par <> "\"")
    let spl0 = String.split (String.Pattern dde) dom
    ucs0 <- uncons spl0
    h <- head ucs0.tail
    let spl1 = String.split (String.Pattern (">")) h
    ucs1 <- uncons spl1
    pure $ ucs0.head <> dde <> ucs1.head <> ">" <> subdom <>
      intercalate ">" ucs1.tail

getBody
  :: forall r
   . FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r String
getBody (FFIDOMSnapshot state) = do
  frozen <- Object.toUnfoldable <$> freezeObj state.units
  -- ugh, technical debt... fix...
  pure $ fromMaybe "ERROR"
    ( findMap
        ( \(a /\ b) -> case b of
            SDyn _ -> Nothing
            SFixed _ -> Nothing
            SEnvy _ -> Nothing
            SText _ -> Nothing
            SComment _ -> Nothing
            SElement { main } -> case main of
              SSRPursxElement _ -> Nothing
              SSRElement { tag }
                | tag == "body" -> Just a
                | otherwise -> Nothing
        )
        frozen
    )

getElementsWhoseParentIsNotInGraph
  :: forall r
   . FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r (Array (String /\ String))
getElementsWhoseParentIsNotInGraph (FFIDOMSnapshot state) = do
  frozen <- freezeObj state.units
  execWriterT
    let
      opar i p' = for_ p' \p'' -> do
        p <- lift $ STO.peek p'' state.units
        case p of
          Nothing -> tell [ p'' /\ i ]
          Just _ -> tell []
    in
      ( traverseWithIndex_
          ( \i u -> case u of
              SDyn { parent } -> opar i parent
              SEnvy { parent } -> opar i parent
              SFixed { parent } -> opar i parent
              SElement { parent } -> opar i parent
              SText { parent } -> opar i parent
              SComment { parent } -> opar i parent
          )
          frozen
      )

-- this function relies on the (ugly) fact that all SElement will _always_ have a single child that is _either_ a fixed _or_ whatever goes into the top-level (envy, fixed or dyn)
makeParentCache
  :: forall r
   . FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r (Map.Map String (Array String))
makeParentCache (FFIDOMSnapshot state) = do
  frozen <- freezeObj state.units
  -- let _ = spy "frozen" state.units
  pure $ unwrap $ execWriter
    let
      opar i parent = for_ parent \p' -> tell
        (SemigroupMap (Map.singleton p' [ i ]))
    in
      ( traverseWithIndex_
          ( \i u -> case u of
              SDyn { parent } -> opar i parent
              SEnvy { parent } -> opar i parent
              SFixed { parent } -> opar i parent
              SElement { parent } -> opar i parent
              SText { parent } -> opar i parent
              SComment { parent } -> opar i parent
          )
          frozen
      )

ssr
  :: forall r
   . FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r String
ssr state = do
  body <- getBody state
  -- let _ = spy "body" body
  parentCache <- makeParentCache state
  -- let _ = spy "parentCache" (foldrWithIndex Object.insert Object.empty parentCache)
  missingParElts <- getElementsWhoseParentIsNotInGraph state
  -- let _ = spy "missingParElts" missingParElts
  bodyRendered <- render parentCache state body
  -- let _ = spy "BR" bodyRendered
  subEltsRendered <- traverse
    ( \(p /\ i) -> do
        r <- render parentCache state i
        pure $ p /\ i /\ r
    )
    missingParElts
  -- let _ = spy "SER" subEltsRendered
  pure (go subEltsRendered bodyRendered)
  where
  go :: Array (String /\ String /\ String) -> String -> String
  go s bod
    | Just { head, tail } <- uncons s = go
        ( map (\(a /\ b /\ c) -> a /\ b /\ doReplacements c head)
            (tail :: Array (String /\ String /\ String))
        )
        (doReplacements bod head)
    | otherwise = bod
