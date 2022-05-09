module Deku.SSR where

import Prelude

import Control.Monad.State (execState, modify)
import Data.Array (findMap, (!!))
import Data.Filterable (filterMap)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Traversable (foldMap, intercalate, traverse)
import Deku.Interpret (Instruction(..))

ssr :: Array Instruction -> String
ssr arr = "<body id=\"deku-root\">" <> o "deku-root" <> "</body>"
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
            MakeElement { parent, id } -> making parent id i
            MakeText { parent, id } -> making parent id i
            MakePursx { parent, id } -> making parent id i
            SetProp { id } -> setting id i
            SetText { id } -> setting id i
        )
        arr
    )
    { parentToChild: Map.empty, idToActions: Map.empty }
  o id = do
    let elts = fromMaybe [] $ Map.lookup id parentToChild
    foldMap singleElt elts
  singleElt id =
    Map.lookup id idToActions # maybe "" \i2a -> do
      let
        makeText _ = do
          "<span id=\"" <> id <> "\">"
            <>
              ( i2a #
                  ( fromMaybe "" <<< findMap case _ of
                      SetText { text } -> Just text
                      _ -> Nothing
                  )
              )
            <> "</span>"
        makeElt _ = do
          let tag = eltTag i2a
          let atts = eltAtts i2a
          "<" <> tag <> " " <> atts <> " id=\"" <> id <> "\">" <> o id <> "</"
            <> tag
            <> ">"
      case i2a !! 0 of
        Just (SetText _) -> makeText unit
        Just (MakeText _) -> makeText unit
        -- todo: strip styling from div
        Just (MakePursx { html }) -> "<div id=\""<>id<>"\">"<>html<>"</div>"
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