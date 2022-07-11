module Deku.SSR where

import Prelude

import Control.Monad.ST (ST)
import Control.Monad.State (lift)
import Control.Monad.Writer (execWriter, execWriterT, tell)
import Data.Array (findMap, head, uncons)
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
        SSRPursxElement { html } -> pure html
      SText e -> pure ("<!--" <> id <> "-->" <> encodedString (unwrap e.main).text)
      SDyn { children } -> fold <$>
        (traverse (render parentCache state') children)
      SEnvy { child } -> fold <$> (traverse (render parentCache state') child)
      SFixed { children } -> fold <$>
        (traverse (render parentCache state') children)

doReplacements :: String -> (String /\ String /\ String) -> String
doReplacements dom (par /\ id /\ subdom) = do
  -- let _ = spy "doReplacements" [par, id, dom, subdom, show nw]
  fromMaybe dom nw
  where
  nw = do
    let dde = ("data-deku-elt-internal=\"" <> par<>"\"")
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
          )
          frozen
      )

foreign import freezeObj :: forall r a. STO.STObject r a -> ST r (Object a)

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
    (\(p /\ i) -> do
      r <- render parentCache state i
      pure $ p /\ i /\ r)
    missingParElts
  -- let _ = spy "SER" subEltsRendered
  pure (go subEltsRendered bodyRendered)
  where
  go :: Array (String /\ String /\ String) -> String -> String
  go s bod
    | Just { head, tail } <- uncons s = go
        (map (\(a /\ b /\ c) -> a /\ b /\ doReplacements c head) (tail :: Array (String /\ String /\ String)))
        (doReplacements bod head)
    | otherwise = bod

-- ssr' :: String -> Array Instruction -> String
-- ssr' topTag arr = "<" <> topTag <> " data-deku-ssr-deku-root=\"true\">"
--   <> oo "deku-root"
--   <> "</"
--   <> topTag
--   <> ">"
--   where
--   making parent id action = do
--     void $ modify
--       ( \s -> s
--           { parentToChild = Map.alter
--               ( case _ of
--                   Just a -> Just (a <> [ id ])
--                   Nothing -> Just [ id ]
--               )
--               parent
--               s.parentToChild
--           }
--       )
--     setting id action
--   setting id action = do
--     void $ modify
--       ( \s -> s
--           { idToActions = Map.alter
--               ( case _ of
--                   Just a -> Just (a <> [ action ])
--                   Nothing -> Just [ action ]
--               )
--               id
--               s.idToActions
--           }
--       )
--   { parentToChild, idToActions } = execState
--     ( traverse
--         ( \i -> case i of
--             -- for now, ssr ignores portals
--             -- so we case on parents being Just
--             MakeElement { parent, id } -> for_ parent \p -> making p id i
--             MakeText { parent, id } -> for_ parent \p -> making p id i
--             MakePursx { parent, id } -> for_ parent \p -> making p id i
--             SetProp { id } -> setting id i
--             SetText { id } -> setting id i
--         )
--         arr
--     )
--     { parentToChild: Map.empty, idToActions: Map.empty }
--   hasMake a = isJust $ find
--     ( case _ of
--         MakeElement _ -> true
--         MakeText _ -> true
--         _ -> false
--     )
--     a
--   o id = do
--     let elts = fromMaybe [] $ Map.lookup id parentToChild
--     foldMap singleElt elts
--   oo id =
--     -- a bit hackish
--     -- if we find a MakeElement or MakeText, we assume that SSR is done
--     -- otherwise, we assume pursX and do manual replacements
--     foldlWithIndex
--       ( \i b a -> case hasMake a of
--           true -> b
--           false -> String.replace (String.Pattern ("data-deku-ssr-" <> i)) (String.Replacement (eltAtts a <> " data-deku-ssr-" <> i)) b
--       )
--       (o id)
--       idToActions
--   singleElt id =
--     Map.lookup id idToActions # maybe "" \i2a -> do
--       let
--         makeText _ = i2a #
--           ( fromMaybe "" <<< findMap case _ of
--               SetText { text } -> Just $ (encodedString text <> "<!--"<>id<>"-->")
--               _ -> Nothing
--           )
--         makeElt _ = do
--           let tag = eltTag i2a
--           let atts = eltAtts i2a
--           "<" <> tag <> " " <> atts <> " data-deku-ssr-" <> id <> "=\"true\">"
--             <> o id
--             <> "</"
--             <> tag
--             <> ">"
--       case i2a !! 0 of
--         Just (SetText _) -> makeText unit
--         Just (MakeText _) -> makeText unit
--         -- todo: strip styling from div
--         Just (MakePursx mpx) -> doPursxReplacements mpx
--         _ -> makeElt unit
--   eltTag i2a = i2a #
--     ( fromMaybe "" <<< findMap case _ of
--         MakeElement { tag } -> Just tag
--         _ -> Nothing
--     )
--   eltAtts i2a = i2a #
--     ( intercalate " " <<< filterMap case _ of
--         SetProp { key, value } -> Just (key <> "=\"" <> value <> "\"")
--         _ -> Nothing
--     )