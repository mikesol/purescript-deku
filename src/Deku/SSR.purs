module Deku.SSR where

import Prelude

import Control.Monad.State (execState, modify)
import Data.Array (find, findMap, (!!))
import Data.Filterable (filterMap)
import Data.FoldableWithIndex (foldlWithIndex)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, isJust, maybe)
import Data.String as String
import Data.Traversable (foldMap, for_, intercalate, traverse)
import Deku.Core as Core
import Deku.Interpret (Instruction(..))

foreign import encodedString :: String -> String
foreign import doPursxReplacements :: Core.MakePursx -> String

ssr :: Array Instruction -> String
ssr = ssr' "body"

ssr' :: String -> Array Instruction -> String
ssr' topTag arr = "<" <> topTag <> " data-deku-ssr-deku-root=\"true\">"
  <> oo "deku-root"
  <> "</"
  <> topTag
  <> ">"
  where
  making parent id action = do
    void $ modify
      ( \s -> s
          { parentToChild = Map.alter
              ( case _ of
                  Just a -> Just (a <> [ id ])
                  Nothing -> Just [ id ]
              )
              parent
              s.parentToChild
          }
      )
    setting id action
  setting id action = do
    void $ modify
      ( \s -> s
          { idToActions = Map.alter
              ( case _ of
                  Just a -> Just (a <> [ action ])
                  Nothing -> Just [ action ]
              )
              id
              s.idToActions
          }
      )
  { parentToChild, idToActions } = execState
    ( traverse
        ( \i -> case i of
            -- for now, ssr ignores portals
            -- so we case on parents being Just
            MakeElement { parent, id } -> for_ parent \p -> making p id i
            MakeText { parent, id } -> for_ parent \p -> making p id i
            MakePursx { parent, id } -> for_ parent \p -> making p id i
            SetProp { id } -> setting id i
            SetText { id } -> setting id i
        )
        arr
    )
    { parentToChild: Map.empty, idToActions: Map.empty }
  hasMake a = isJust $ find
    ( case _ of
        MakeElement _ -> true
        MakeText _ -> true
        _ -> false
    )
    a
  o id = do
    let elts = fromMaybe [] $ Map.lookup id parentToChild
    foldMap singleElt elts
  oo id =
    -- a bit hackish
    -- if we find a MakeElement or MakeText, we assume that SSR is done
    -- otherwise, we assume pursX and do manual replacements
    foldlWithIndex
      ( \i b a -> case hasMake a of
          true -> b
          false -> String.replace (String.Pattern ("data-deku-ssr-" <> i)) (String.Replacement (eltAtts a <> " data-deku-ssr-" <> i)) b
      )
      (o id)
      idToActions
  singleElt id =
    Map.lookup id idToActions # maybe "" \i2a -> do
      let
        makeText _ = i2a #
          ( fromMaybe "" <<< findMap case _ of
              SetText { text } -> Just $ encodedString text
              _ -> Nothing
          )
        makeElt _ = do
          let tag = eltTag i2a
          let atts = eltAtts i2a
          "<" <> tag <> " " <> atts <> " data-deku-ssr-" <> id <> "=\"true\">"
            <> o id
            <> "</"
            <> tag
            <> ">"
      case i2a !! 0 of
        Just (SetText _) -> makeText unit
        Just (MakeText _) -> makeText unit
        -- todo: strip styling from div
        Just (MakePursx mpx) -> doPursxReplacements mpx
        _ -> makeElt unit
  eltTag i2a = i2a #
    ( fromMaybe "" <<< findMap case _ of
        MakeElement { tag } -> Just tag
        _ -> Nothing
    )
  eltAtts i2a = i2a #
    ( intercalate " " <<< filterMap case _ of
        SetProp { key, value } -> Just (key <> "=\"" <> value <> "\"")
        _ -> Nothing
    )