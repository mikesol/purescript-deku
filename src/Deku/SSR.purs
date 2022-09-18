module Deku.SSR where

import Prelude

import Control.Monad.State (execState, modify)
import Data.Array (find, findMap, (!!))
import Data.Array as Array
import Data.CatList as List
import Data.Filterable (filterMap)
import Data.FoldableWithIndex (foldlWithIndex)
import Data.Function (on)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, isJust, maybe)
import Data.String as String
import Data.Traversable (foldMap, for_, intercalate, traverse)
import Data.Tuple.Nested ((/\))
import Deku.Core as Core
import Deku.Interpret (EliminatableInstruction(..), Instruction(..), RenderableInstruction(..))

foreign import encodedString :: String -> String
foreign import doPursxReplacements :: Core.MakePursx -> String

ssr :: Array Instruction -> String
ssr = ssr' "body"

ssr' :: String -> Array Instruction -> String
ssr' topTag arr' = "<" <> topTag <> " data-deku-ssr-deku-root=\"true\">"
  <> oo "deku-root"
  <> "</"
  <> topTag
  <> ">"
  where
  arr = instructionsToRenderableInstructions arr'

  instructionsToRenderableInstructions
    :: Array Instruction -> List.CatList RenderableInstruction
  instructionsToRenderableInstructions aa = go
    where
    go = moveClosingsToEnd [] List.empty $ doEliminations List.empty asList
    moveClosingsToEnd processed cl q = case List.uncons q of
      Just (MakeCloseDynBeacon i /\ rest)
        | Array.elem i.id processed -> moveClosingsToEnd processed
            -- because of the way sorting works
            -- the id needs to be the id that will be in the real cache
            -- so we append %-%, as we do in Interpret.purs
            -- otherwise one ID will overwrite the other in the map below
            (List.snoc cl (MakeCloseDynBeacon (i { id = i.id <> "%-%" })))
            rest
        | otherwise -> moveClosingsToEnd ([ i.id ] <> processed) cl $
            moveClosingToEnd List.empty List.empty i rest
      Just (i /\ rest) -> moveClosingsToEnd processed (List.snoc cl i) rest
      Nothing -> cl

    moveClosingToEnd
      :: List.CatList RenderableInstruction
      -> List.CatList RenderableInstruction
      -> Core.MakeDynBeacon
      -> List.CatList RenderableInstruction
      -> List.CatList RenderableInstruction
    moveClosingToEnd staging1 staging2 dbc = List.uncons >>> case _ of
      Just (inst@((MakeOpenDynBeacon odb)) /\ rest)
        | odb.dynFamily == Just dbc.id -> moveClosingToEnd
            (List.snoc (staging1 <> staging2) inst)
            List.empty
            dbc
            rest
        | otherwise -> moveClosingToEnd staging1 (List.snoc staging2 inst) dbc
            rest
      Just (inst@((MakeCloseDynBeacon cdb)) /\ rest)
        | cdb.dynFamily == Just dbc.id -> moveClosingToEnd
            (List.snoc (staging1 <> staging2) inst)
            List.empty
            dbc
            rest
        | otherwise -> moveClosingToEnd staging1 (List.snoc staging2 inst) dbc
            rest
      Just (inst@((MakeText txt)) /\ rest)
        | txt.dynFamily == Just dbc.id -> moveClosingToEnd
            (List.snoc (staging1 <> staging2) inst)
            List.empty
            dbc
            rest
        | otherwise -> moveClosingToEnd staging1 (List.snoc staging2 inst) dbc
            rest
      Just (inst@((MakePursx px)) /\ rest)
        | px.dynFamily == Just dbc.id -> moveClosingToEnd
            (List.snoc (staging1 <> staging2) inst)
            List.empty
            dbc
            rest
        | otherwise -> moveClosingToEnd staging1 (List.snoc staging2 inst) dbc
            rest
      Just (inst@((MakeElement me)) /\ rest)
        | me.dynFamily == Just dbc.id -> moveClosingToEnd
            (List.snoc (staging1 <> staging2) inst)
            List.empty
            dbc
            rest
        | otherwise -> moveClosingToEnd staging1 (List.snoc staging2 inst) dbc
            rest
      Just (inst@((SetProp _)) /\ rest) -> moveClosingToEnd staging1
        (List.snoc staging2 inst)
        dbc
        rest
      Just (inst@((SetText _)) /\ rest) -> moveClosingToEnd staging1
        (List.snoc staging2 inst)
        dbc
        rest
      Nothing -> staging1 <> pure ((MakeCloseDynBeacon dbc)) <> staging2
    doEliminations cl = List.uncons >>> case _ of
      Just (RenderableInstruction i /\ rest) -> doEliminations (List.snoc cl i)
        rest
      Just (EliminatableInstruction (SendToPos stp) /\ rest) ->
        doEliminations (sendPos stp.id stp.pos <$> cl) rest
      Just (EliminatableInstruction (GiveNewParent gnp) /\ rest) ->
        doEliminations (giveParent gnp.id gnp.parent <$> cl) rest
      Just (EliminatableInstruction (DisconnectElement dce) /\ rest) ->
        doEliminations (removeParent dce.id <$> cl) rest
      Just (EliminatableInstruction (RemoveDynBeacon rdb) /\ rest) ->
        doEliminations (doDeleteFromCache List.empty rdb.id cl) rest
      Just (EliminatableInstruction (DeleteFromCache dfc) /\ rest) ->
        doEliminations (doDeleteFromCache List.empty dfc.id cl) rest
      Nothing -> cl
    sendPos id' pos' = case _ of
      elt@(MakeElement elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeElement
          (elt' { pos = Just pos' })
        else elt
      elt@(MakeText elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeText
          (elt' { pos = Just pos' })
        else elt
      elt@(MakePursx elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakePursx
          (elt' { pos = Just pos' })
        else elt
      elt@(MakeOpenDynBeacon elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeOpenDynBeacon
          (elt' { pos = Just pos' })
        else elt
      elt@(MakeCloseDynBeacon elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeCloseDynBeacon
          (elt' { pos = Just pos' })
        else elt
      elt@(SetText _) -> elt
      elt@(SetProp _) -> elt
    giveParent id' parent' = case _ of
      elt@(MakeElement elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeElement
          (elt' { parent = Just parent' })
        else elt
      elt@(MakeText elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeText
          (elt' { parent = Just parent' })
        else elt
      elt@(MakePursx elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakePursx
          (elt' { parent = Just parent' })
        else elt
      elt@(MakeOpenDynBeacon elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeOpenDynBeacon
          (elt' { parent = Just parent' })
        else elt
      elt@(MakeCloseDynBeacon elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeCloseDynBeacon
          (elt' { parent = Just parent' })
        else elt
      elt@(SetText _) -> elt
      elt@(SetProp _) -> elt
    removeParent id' = case _ of
      elt@(MakeElement elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeElement
          (elt' { parent = Nothing })
        else elt
      elt@(MakeText elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeText
          (elt' { parent = Nothing })
        else elt
      elt@(MakePursx elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakePursx
          (elt' { parent = Nothing })
        else elt
      elt@(MakeOpenDynBeacon elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeOpenDynBeacon
          (elt' { parent = Nothing })
        else elt
      elt@(MakeCloseDynBeacon elt'@({ id, dynFamily })) ->
        if id == id' || dynFamily == Just id then MakeCloseDynBeacon
          (elt' { parent = Nothing })
        else elt
      elt@(SetText _) -> elt
      elt@(SetProp _) -> elt

    doDeleteFromCache cl id' = List.uncons >>> case _ of
      Just (elt@(MakeElement { id }) /\ rest) ->
        if id == id' then doDeleteFromCache cl id' rest
        else doDeleteFromCache (List.snoc cl elt) id' rest
      Just (elt@(MakeText { id }) /\ rest) ->
        if id == id' then doDeleteFromCache cl id' rest
        else doDeleteFromCache (List.snoc cl elt) id' rest
      Just (elt@(MakePursx { id }) /\ rest) ->
        if id == id' then doDeleteFromCache cl id' rest
        else doDeleteFromCache (List.snoc cl elt) id' rest
      Just (elt@(MakeOpenDynBeacon { id }) /\ rest) ->
        if id == id' then doDeleteFromCache cl id' rest
        else doDeleteFromCache (List.snoc cl elt) id' rest
      Just (elt@(MakeCloseDynBeacon { id }) /\ rest) ->
        if id == id' then doDeleteFromCache cl id' rest
        else doDeleteFromCache (List.snoc cl elt) id' rest
      Just (elt@(SetProp { id }) /\ rest) ->
        if id == id' then doDeleteFromCache cl id' rest
        else doDeleteFromCache (List.snoc cl elt) id' rest
      Just (elt@(SetText { id }) /\ rest) ->
        if id == id' then doDeleteFromCache cl id' rest
        else doDeleteFromCache (List.snoc cl elt) id' rest
      Nothing -> cl
    asList = List.fromFoldable aa
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
  { parentToChild, idToActions } =
    ( \x ->
        { parentToChild: x.parentToChild <#> Array.sortBy
            ( compare `on` \i -> Map.lookup i x.idToActions >>= Array.head >>=
                case _ of
                  MakeElement { pos } -> pos
                  MakeText { pos } -> pos
                  MakePursx { pos } -> pos
                  MakeOpenDynBeacon { pos } -> pos
                  MakeCloseDynBeacon { pos } -> pos
                  -- we can safely push setters to the back
                  -- todo: is this a true assumption?
                  SetProp _ -> Just top
                  SetText _ -> Just top
            )
        , idToActions: x.idToActions
        }
    ) $ execState
      ( traverse
          ( \i -> case i of
              -- for now, ssr ignores portals
              -- so we case on parents being Just
              MakeElement { parent, id } -> for_ parent \p -> making p id i
              MakeText { parent, id } -> for_ parent \p -> making p id i
              MakePursx { parent, id } -> for_ parent \p -> making p id i
              MakeOpenDynBeacon { parent, id } -> for_ parent \p -> making p id
                i
              MakeCloseDynBeacon { parent, id } -> for_ parent \p -> making p id
                i
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
        MakeOpenDynBeacon _ -> true
        MakeCloseDynBeacon _ -> true
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
          false -> String.replace (String.Pattern ("data-deku-ssr-" <> i))
            (String.Replacement (eltAtts a <> " data-deku-ssr-" <> i))
            b
      )
      (o id)
      idToActions
  singleElt id =
    Map.lookup id idToActions # maybe "" \i2a -> do
      let
        makeText _ = i2a #
          ( fromMaybe "" <<< findMap case _ of
              SetText { text } -> Just $
                (encodedString text <> "<!--" <> id <> "-->")
              _ -> Nothing
          )
        makeOpenDynBeacon _ = "<!--%-%" <> id <> "-->"
        makeCloseDynBeacon _ = "<!--%-%" <> id <> "-->"
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
        Just (MakeOpenDynBeacon _) -> makeOpenDynBeacon unit
        Just (MakeCloseDynBeacon _) -> makeCloseDynBeacon unit
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