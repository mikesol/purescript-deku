-- | This module is for internal use only, and should only be consulted by people
-- | implementing a Deku backend. It is not part of the public API, and does not yet
-- | have documentation. If you are not implementing a Deku backend, please ping
-- | the #frp channel of the PureScript Discord. If enough people are implementing
-- | Deku backends, someone may document this stuff at some point.
module Deku.Interpret where

import Prelude

import Control.Monad.Maybe.Trans (MaybeT(..), runMaybeT)
import Control.Monad.Rec.Class (Step(..), tailRecM)
import Control.Monad.ST.Class (liftST)
import Data.Array.NonEmpty (toArray)
import Data.Array.ST as STArray
import Data.Compactable (compact)
import Data.Either (Either(..))
import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (for_)
import Data.FoldableWithIndex (foldrWithIndex)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.String (toUpper)
import Data.String as String
import Data.String.Regex (match, regex)
import Data.String.Regex.Flags (global)
import Deku.Attribute (Cb(..), Key(..), Value(..), unsafeAttribute)
import Deku.Core (DekuBeacon, DekuChild(..), DekuElement, DekuOutcome(..), DekuParent(..), DekuText, Html(..), Nut(..), PSR(..), Tag(..), Verb(..), handleAtts)
import Deku.Core as Core
import Deku.JSWeakRef (WeakRef)
import Effect (Effect, foreachE)
import Effect.Console (error)
import Effect.Uncurried (EffectFn3, EffectFn4, mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn4, mkEffectFn5, runEffectFn2, runEffectFn3, runEffectFn4)
import Foreign.Object as Object
import Foreign.Object.ST as STObject
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Untagged.Union (type (|+|))
import Web.DOM (Comment, Element, Text)
import Web.DOM as Node
import Web.DOM.ChildNode (remove)
import Web.DOM.Comment as Comment
import Web.DOM.DOMParser (makeDOMParser, parseHTMLFromString)
import Web.DOM.Document (createComment, createElement, createElementNS, createTextNode)
import Web.DOM.Element (getAttribute, removeAttribute, setAttribute, toChildNode, toEventTarget)
import Web.DOM.Element as Element
import Web.DOM.Node (appendChild, firstChild, insertBefore, nextSibling, nodeTypeIndex, parentNode, replaceChild, setTextContent, textContent)
import Web.DOM.NodeList as NodeList
import Web.DOM.ParentNode (QuerySelector(..), querySelectorAll)
import Web.DOM.Text as Text
import Web.Event.Event (EventType(..))
import Web.Event.Event as Web
import Web.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import Web.HTML (window)
import Web.HTML.HTMLButtonElement as HTMLButtonElement
import Web.HTML.HTMLDocument (fromDocument, toDocument)
import Web.HTML.HTMLDocument as HTMLDocument
import Web.HTML.HTMLElement as HTMLElement
import Web.HTML.HTMLFieldSetElement as HTMLFieldSetElement
import Web.HTML.HTMLInputElement as HTMLInputElement
import Web.HTML.HTMLKeygenElement as HTMLKeygenElement
import Web.HTML.HTMLLinkElement as HTMLLinkElement
import Web.HTML.HTMLOptGroupElement as HTMLOptGroupElement
import Web.HTML.HTMLOptionElement as HTMLOptionElement
import Web.HTML.HTMLSelectElement as HTMLSelectElement
import Web.HTML.HTMLTextAreaElement as HTMLTextAreaElement
import Web.HTML.Window (document)

type MapEntry = (WeakRef DekuElement) |+| (WeakRef DekuBeacon) |+|
  (WeakRef DekuText)

toDekuElement :: Element -> DekuElement
toDekuElement = unsafeCoerce

fromDekuElement :: DekuElement -> Element
fromDekuElement = unsafeCoerce

toDekuBeacon :: Comment -> DekuBeacon
toDekuBeacon = unsafeCoerce

fromDekuBeacon :: DekuBeacon -> Comment
fromDekuBeacon = unsafeCoerce

toDekuText :: Text -> DekuText
toDekuText = unsafeCoerce

fromDekuText :: DekuText -> Text
fromDekuText = unsafeCoerce

makeElementEffect :: Core.MakeElement
makeElementEffect = mkEffectFn2 \ns tag -> do
  doc <- window >>= document
  elt <- case coerce ns :: Maybe String of
    Nothing -> createElement (toUpper (coerce tag)) (toDocument doc)
    Just ns' -> createElementNS (Just $ coerce ns') (toUpper (coerce tag))
      (toDocument doc)
  pure $ toDekuElement elt

d3kU = "d3kU" :: String
uk3D = "ul3D" :: String

-- gets the next positional node
ffwd
  :: { n :: Int, node :: Node.Node, cpos :: Int }
  -> Effect
       ( Step { n :: Int, node :: Node.Node, cpos :: Int }
           { cpos :: Int, sb :: Maybe Node.Node }
       )
ffwd { n, node, cpos } = do
  nxt <- nextSibling node
  case nxt, nodeTypeIndex node, n of
    Nothing, _, _ -> pure $ Done { cpos, sb: Nothing }
    -- the current node is an element
    Just nx, 1, 0 -> pure $ Done { cpos, sb: Just nx }
    -- the current node is text
    Just nx, 3, 0 -> pure $ Done { cpos, sb: Just nx }
    Just nx, 8, _ -> do
      ctext <- textContent node
      case ctext of
        i
          -- the current node starts a dyn
          | i == d3kU -> pure $ Loop { n: n + 1, node: nx, cpos }
          -- the current node ends this dyn
          -- so the next node is out of the dyn
          | i == uk3D && n == 1 -> pure $ Done { cpos, sb: Just nx }
          -- the current node closes a dyn
          | i == uk3D -> pure $ Loop { n: n - 1, node: nx, cpos }
          -- random comment, carry on
          | otherwise -> pure $ Loop { n, node: nx, cpos }
    -- exotic node, carry on
    Just nx, _, _ -> pure $ Loop { n, node: nx, cpos }

attributeDynParentForNodeEffect
  :: EffectFn4 Node.Node DekuBeacon
       DekuBeacon
       (Maybe Int)
       Unit
attributeDynParentForNodeEffect = mkEffectFn4
  \nd start end mpos -> do
    let
      doInsertAtEnd = do
        pn <- parentNode (Comment.toNode (fromDekuBeacon end))
        case pn of
          Just x -> insertBefore nd
            (Comment.toNode (fromDekuBeacon end))
            x
          Nothing -> error
            "Programming error: parent node missing in attributeDynParentForNodeEffect (3)"
        pure $ Done unit
    case mpos of
      Just pos -> do
        let
          go (Left { curSib, cpos }) = do
            if cpos >= pos then do
              par <- parentNode curSib
              case par of
                Just x -> insertBefore nd curSib x
                Nothing -> error
                  "Programming error: parent node missing in attributeDynParentForNodeEffect (1)"
              pure $ Done unit
            else
              ifM
                -- have we hit an end binding
                -- ffwd will never hit this
                -- so if we hit it it must be the end of the dyn
                -- we don't need to check for equality with the end
                -- because "parentheses" are assumed to be balanced
                ( if nodeTypeIndex curSib /= 8 then pure false
                  else do
                    ctext <- textContent curSib
                    pure $ ctext == uk3D
                )
                doInsertAtEnd
                (Loop <<< Right <$> ffwd { n: 0, node: curSib, cpos })
          go (Right (Loop l)) = Loop <<< Right <$> ffwd l
          go (Right (Done { sb, cpos })) = do
            case sb of
              Just sb' -> do
                pure $ Loop $ Left { curSib: sb', cpos: cpos + 1 }
              Nothing -> doInsertAtEnd
        firstOrEnd <- nextSibling (Comment.toNode (fromDekuBeacon start))
        case firstOrEnd of
          Just st -> tailRecM go $ Left { cpos: 0, curSib: st }
          Nothing -> error
            "Programming error: no boundary found in attributeDynParentForNodeEffect"
      Nothing -> do
        pn <- parentNode (Comment.toNode (fromDekuBeacon end))
        case pn of
          Just x -> insertBefore nd (Comment.toNode (fromDekuBeacon end)) x
          Nothing -> error
            "Programming error: parent node missing in attributeDynParentForNodeEffect (4)"

attributeDynParentForElementEffect :: Core.AttributeDynParentForElement
attributeDynParentForElementEffect = mkEffectFn4
  \(DekuChild child) start end mpos -> runEffectFn4
    attributeDynParentForNodeEffect
    (Element.toNode (fromDekuElement child))
    start
    end
    mpos

attributeDynParentForTextEffect :: Core.AttributeDynParentForText
attributeDynParentForTextEffect = mkEffectFn4
  \txt start end mpos -> runEffectFn4
    attributeDynParentForNodeEffect
    (Text.toNode (fromDekuText txt))
    start
    end
    mpos

attributeElementParentEffect :: Core.AttributeElementParent
attributeElementParentEffect = mkEffectFn2
  \(DekuChild child) (DekuParent parent) -> do
    appendChild (Element.toNode (fromDekuElement child))
      (Element.toNode (fromDekuElement parent))

attributeTextParentEffect :: Core.AttributeTextParent
attributeTextParentEffect = mkEffectFn2
  \txt (DekuParent parent) -> do
    appendChild (Text.toNode (fromDekuText txt))
      (Element.toNode (fromDekuElement parent))

makeOpenBeaconEffect :: Core.MakeBeacon
makeOpenBeaconEffect = do
  doc <- window >>= document
  cm <- createComment d3kU (toDocument doc)
  pure (toDekuBeacon cm)

makeCloseBeaconEffect :: Core.MakeBeacon
makeCloseBeaconEffect = do
  doc <- window >>= document
  cm <- createComment uk3D (toDocument doc)
  pure (toDekuBeacon cm)

attributeBeaconParentEffect :: Core.AttributeBeaconParent
attributeBeaconParentEffect = mkEffectFn2 \beacon (DekuParent parent) -> do
  appendChild (Comment.toNode (fromDekuBeacon beacon))
    (Element.toNode (fromDekuElement parent))

attributeDynParentForBeaconsEffect :: Core.AttributeDynParentForBeacons
attributeDynParentForBeaconsEffect = mkEffectFn5
  \i o start end mpos -> do
    let oo = Comment.toNode (fromDekuBeacon o)
    let ii = Comment.toNode (fromDekuBeacon i)
    runEffectFn4 attributeDynParentForNodeEffect oo start end mpos
    p <- parentNode oo
    case p of
      Just x -> insertBefore ii oo x
      Nothing -> do
        error
          "Programming error: parent node missing in attributeDynParentForBeaconsEffect"

attributeBeaconFullRangeParentProto
  :: EffectFn3 Boolean (Node.Node -> Effect Unit) Node.Node Unit
attributeBeaconFullRangeParentProto = mkEffectFn3
  \skipFirst mover initial ->
    do
      let
        go { n, node } = do
          nxt <- nextSibling node
          mover node
          case nxt of
            Nothing -> do
              error
                "Programming error: attributeBeaconFullRangeParentProto out of range"
              pure $ Done unit
            Just nx -> case nodeTypeIndex nx of
              8 -> do
                ctext <- textContent nx
                case ctext of
                  i
                    | i == d3kU -> pure $ Loop
                        { n: n + 1, node: nx }
                    | i == uk3D && n == 0 -> do
                        mover nx
                        pure $ Done unit
                    | i == uk3D -> pure $ Loop
                        { n: n - 1, node: nx }
                    | otherwise -> pure $ Loop { n, node: nx }
              _ -> pure $ Loop { n, node: nx }
      n <-
        if not skipFirst then pure 0
        else do
          case nodeTypeIndex initial of
            8 -> do
              ctext <- textContent initial
              case ctext of
                i
                  | i == d3kU -> pure 1
                  | otherwise -> pure 0
            _ -> pure 0
      tailRecM go { n, node: initial }

attributeBeaconFullRangeParentEffect :: Core.AttributeBeaconFullRangeParent
attributeBeaconFullRangeParentEffect = mkEffectFn2
  \stBeacon (DekuParent parent) -> runEffectFn3
    attributeBeaconFullRangeParentProto
    false
    (flip appendChild (Element.toNode (fromDekuElement parent)))
    (Comment.toNode (fromDekuBeacon stBeacon))

attributeDynParentForBeaconFullRangeEffect
  :: Core.AttributeDynParentForBeaconFullRange
attributeDynParentForBeaconFullRangeEffect = mkEffectFn4
  \stBeacon leftB rightB mpos -> do
    nsOld <- nextSibling (Comment.toNode (fromDekuBeacon stBeacon))
    runEffectFn4
      attributeDynParentForNodeEffect
      (Comment.toNode (fromDekuBeacon stBeacon))
      leftB
      rightB
      mpos
    par <- parentNode (Comment.toNode (fromDekuBeacon stBeacon))
    ns <- nextSibling (Comment.toNode (fromDekuBeacon stBeacon))
    case par, ns, nsOld of
      Just par', Just ns', Just nso -> runEffectFn3
        attributeBeaconFullRangeParentProto
        true
        (\i -> insertBefore i ns' par')
        nso
      _, _, _ -> error
        "Programming error: attributeDynParentForBeaconFullRangeEffect cannot find parent"

makeTextEffect :: Core.MakeText
makeTextEffect = mkEffectFn1 \mstr -> do
  doc <- window >>= document
  txt <- createTextNode (fromMaybe "" mstr) (toDocument doc)
  pure $ toDekuText txt

newtype FeI e = FeI
  { f :: Boolean -> e -> Effect Unit, e :: Element -> Maybe e }

newtype FeO e = FeO { f :: Boolean -> e -> Effect Unit, e :: e }

getDisableable :: Element -> List (Exists FeI) -> Maybe (Exists FeO)
getDisableable elt = go
  where
  go Nil = Nothing
  go (x : _)
    | Just o <-
        runExists
          (\(FeI { f, e }) -> e elt <#> \e' -> mkExists (FeO { f, e: e' }))
          x = Just o
  go (_ : y) = go y

setPropEffect :: Core.SetProp
setPropEffect = mkEffectFn3 \elt' (Key k) (Value v) -> do
  let elt = fromDekuElement elt'
  let
    o
      | k == "value"
      , Just ie <- HTMLInputElement.fromElement elt = HTMLInputElement.setValue
          v
          ie
      | k == "value"
      , Just tx <- HTMLTextAreaElement.fromElement elt =
          HTMLTextAreaElement.setValue v tx
      | k == "checked"
      , Just ie <- HTMLInputElement.fromElement elt =
          HTMLInputElement.setChecked (v == "true") ie
      | k == "disabled"
      , Just fe <-
          getDisableable elt
            ( mkExists
                ( FeI
                    { e: HTMLButtonElement.fromElement
                    , f: HTMLButtonElement.setDisabled
                    }
                )
                : mkExists
                    ( FeI
                        { e: HTMLInputElement.fromElement
                        , f: HTMLInputElement.setDisabled
                        }
                    )
                : mkExists
                    ( FeI
                        { e: HTMLFieldSetElement.fromElement
                        , f: HTMLFieldSetElement.setDisabled
                        }
                    )
                : mkExists
                    ( FeI
                        { e: HTMLKeygenElement.fromElement
                        , f: HTMLKeygenElement.setDisabled
                        }
                    )
                : mkExists
                    ( FeI
                        { e: HTMLLinkElement.fromElement
                        , f: HTMLLinkElement.setDisabled
                        }
                    )
                : mkExists
                    ( FeI
                        { e: HTMLOptGroupElement.fromElement
                        , f: HTMLOptGroupElement.setDisabled
                        }
                    )
                : mkExists
                    ( FeI
                        { e: HTMLOptionElement.fromElement
                        , f: HTMLOptionElement.setDisabled
                        }
                    )
                : mkExists
                    ( FeI
                        { e: HTMLSelectElement.fromElement
                        , f: HTMLSelectElement.setDisabled
                        }
                    )
                : mkExists
                    ( FeI
                        { e: HTMLTextAreaElement.fromElement
                        , f: HTMLTextAreaElement.setDisabled
                        }
                    )
                : Nil
            ) = runExists (\(FeO { f, e }) -> f (v == "true") e) fe
      | otherwise = setAttribute k v elt
  o

setCbEffect :: Core.SetCb
setCbEffect = mkEffectFn4 \elt' (Key k) (Cb v) stobj -> do
  if k == "@self@" then do
    void $ v ((unsafeCoerce :: DekuElement -> Web.Event) elt')
  else do
    l <- liftST $ STObject.peek k stobj
    let eventType = EventType k
    let eventTarget = toEventTarget (fromDekuElement elt')
    for_ l \toRemove -> removeEventListener eventType toRemove true eventTarget
    nl <- eventListener v
    addEventListener eventType nl true eventTarget
    liftST $ void $ STObject.poke k nl stobj

unsetAttributeEffect :: Core.UnsetAttribute
unsetAttributeEffect = mkEffectFn3 \elt' (Key k) stobj -> do
  l <- liftST $ STObject.peek k stobj
  let asElt = fromDekuElement elt'
  let eventType = EventType k
  let eventTarget = toEventTarget asElt
  for_ l \toRemove -> do
    removeEventListener eventType toRemove true eventTarget
    liftST $ STObject.delete k stobj
  removeAttribute k asElt

setTextEffect :: Core.SetText
setTextEffect = mkEffectFn2 \txt' str -> do
  let txt = fromDekuText txt'
  setTextContent str (Text.toNode txt)

-- for the send pos family of functions
-- we remove first
sendToPosForDynEffect :: Core.SendToPosForDyn
sendToPosForDynEffect = mkEffectFn4 \i b st ed -> do
  runEffectFn2 removeForDynEffect true b
  runEffectFn4 attributeDynParentForBeaconFullRangeEffect b st ed (Just i)

sendToPosForElementEffect :: Core.SendToPosForElement
sendToPosForElementEffect = mkEffectFn4 \i b st ed -> do
  runEffectFn2 removeForElementEffect true b
  runEffectFn4 attributeDynParentForElementEffect (DekuChild b) st ed (Just i)

sendToPosForTextEffect :: Core.SendToPosForText
sendToPosForTextEffect = mkEffectFn4 \i b st ed -> do
  runEffectFn2 removeForTextEffect true b
  runEffectFn4 attributeDynParentForTextEffect b st ed (Just i)

-- for now ignore isPortal elements
removeForDynEffect :: Core.RemoveForDyn
removeForDynEffect = mkEffectFn2 \_ l -> do
  -- todo: is a dyn always an acceptable dummy parent element?
  e <- runEffectFn2 makeElementEffect Nothing (Tag "div")
  runEffectFn2 attributeBeaconFullRangeParentEffect l (DekuParent e)

removeForElementEffect :: Core.RemoveForElement
removeForElementEffect = mkEffectFn2 \_ e -> do
  remove (toChildNode (fromDekuElement e))

removeForTextEffect :: Core.RemoveForText
removeForTextEffect = mkEffectFn2 \_ t -> do
  remove (Text.toChildNode (fromDekuText t))

matchTildes :: String -> Array String
matchTildes nodeContent =
  case regex "~([^~]+)~" global of
    Right r ->
      -- Extract matched content for all matches
      maybe [] (compact <<< toArray) (match r nodeContent)
    Left _ -> []

data ListList a = KeepGoing (List a) (ListList a) | Stop

foreign import outerHtml :: Element.Element -> String

makePursxEffect :: Core.MakePursx
makePursxEffect = mkEffectFn5
  \(Html html) (Verb verb) atts nuts di -> do
    let
      foldedHtml = foldrWithIndex
        ( \i _ -> String.replace (String.Pattern $ verb <> i <> verb)
            ( String.Replacement $
                "<span data-deku-elt-internal=\""
                  <> i
                  <>
                    "\"></span>"
            )
        )
        ( foldrWithIndex
            ( \i _ -> String.replace (String.Pattern $ verb <> i <> verb)
                (String.Replacement $ "data-deku-attr-internal=\"" <> i <> "\"")
            )
            html
            atts
        )
        nuts
    dp <- makeDOMParser
    h <- parseHTMLFromString foldedHtml dp
    let failure = runEffectFn2 makeElementEffect Nothing (Tag "div")
    case h of
      Left err -> do
        error $
          "Programming error: makePursxEffect type-level validation failed: " <>
            err
        failure
      Right elt' -> do
        iii <- runMaybeT do
          o <- MaybeT $ pure $ fromDocument elt'
          oo <- MaybeT $ HTMLDocument.body o
          pure $ HTMLElement.toElement oo
        case iii of
          Just elt -> do
            nl <- querySelectorAll (QuerySelector "[data-deku-attr-internal]")
              (Element.toParentNode elt)
            arr <- NodeList.toArray nl
            obj <- liftST STObject.new
            foreachE arr \nd -> do
              case Element.fromNode nd of
                Just asElt -> do
                  attTag <- getAttribute "data-deku-attr-internal" asElt
                  case attTag >>= flip Object.lookup atts of
                    Just att -> do
                      star <- liftST $ STArray.new
                      -- todo: does this map have a runtime hit?
                      handleAtts di obj (toDekuElement asElt) star
                        [ (map unsafeAttribute att) ]
                    Nothing -> do
                      error $ "Programming error: att not found in pursx"
                Nothing -> do
                  error $
                    "Programming error: non-element with attr-internal tag"
            nllll <- querySelectorAll (QuerySelector "[data-deku-elt-internal]")
              (Element.toParentNode elt)
            arrrrrr <- NodeList.toArray nllll
            foreachE arrrrrr \nd -> do
              case Element.fromNode nd of
                Just asElt -> do
                  eltTag <- getAttribute "data-deku-elt-internal" asElt
                  case eltTag >>= flip Object.lookup nuts of
                    Just (Nut replacementNode) -> do
                      -- todo: does this map have a runtime hit?
                      x' <- parentNode (Element.toNode asElt)
                      case x' >>= Element.fromNode of
                        Nothing ->
                          error
                            "Programming error: could not find parent for pursx element"
                        Just x -> do
                          myNut <- runEffectFn2 replacementNode
                            ( PSR
                                { parent: toDekuElement x
                                , fromPortal: false
                                , unsubs: []
                                , beacon: Nothing
                                }
                            )
                            di
                          case myNut of
                            DekuElementOutcome eo -> replaceChild
                              (Element.toNode (fromDekuElement eo))
                              (Element.toNode asElt)
                              (Element.toNode x)
                            DekuTextOutcome to -> replaceChild
                              (Text.toNode (fromDekuText to))
                              (Element.toNode asElt)
                              (Element.toNode x)
                            DekuBeaconOutcome bo -> do
                              runEffectFn3
                                attributeBeaconFullRangeParentProto
                                false
                                ( \i -> insertBefore i (Element.toNode asElt)
                                    (Element.toNode x)
                                )
                                (Comment.toNode (fromDekuBeacon bo))
                              remove (Element.toChildNode asElt)
                            NoOutcome -> pure unit
                    Nothing -> do
                      error $ "Programming error: att not found in pursx"
                Nothing -> do
                  error $
                    "Programming error: non-element with attr-internal tag"
            ooo <- runMaybeT do
              asn <- MaybeT $ firstChild (Element.toNode elt)
              tn <- MaybeT $ pure $ Element.fromNode asn
              pure $ toDekuElement tn
            case ooo of
              Just oooo' -> pure oooo'
              Nothing -> do
                error $
                  "Programming error: document parser does not yield first element"
                failure
          Nothing -> do
            error $ "Programming error: document parser yielded non-document"
            failure

fullDOMInterpret :: Core.DOMInterpret
fullDOMInterpret = Core.DOMInterpret
  { makeElement: makeElementEffect
  , setProp: setPropEffect
  , setCb: setCbEffect
  , unsetAttribute: unsetAttributeEffect
  , attributeElementParent: attributeElementParentEffect
  , attributeDynParentForElement: attributeDynParentForElementEffect
  , sendToPosForElement: sendToPosForElementEffect
  , removeForElement: removeForElementEffect
  --
  , makeOpenBeacon: makeOpenBeaconEffect
  , makeCloseBeacon: makeCloseBeaconEffect
  , attributeBeaconParent: attributeBeaconParentEffect
  , attributeDynParentForBeacons: attributeDynParentForBeaconsEffect
  , attributeBeaconFullRangeParent: attributeBeaconFullRangeParentEffect
  , attributeDynParentForBeaconFullRange:
      attributeDynParentForBeaconFullRangeEffect
  , sendToPosForDyn: sendToPosForDynEffect
  , removeForDyn: removeForDynEffect
  --
  , makeText: makeTextEffect
  , setText: setTextEffect
  , attributeTextParent: attributeTextParentEffect
  , attributeDynParentForText: attributeDynParentForTextEffect
  , sendToPosForText: sendToPosForTextEffect
  , removeForText: removeForTextEffect
  --
  , makePursx: makePursxEffect
  --
  }