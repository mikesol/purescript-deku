-- | This module is for internal use only, and should only be consulted by people
-- | implementing a Deku backend. It is not part of the public API, and does not yet
-- | have documentation. If you are not implementing a Deku backend, please ping
-- | the #frp channel of the PureScript Discord. If enough people are implementing
-- | Deku backends, someone may document this stuff at some point.
module Deku.Interpret where

import Prelude

import Control.Monad.Rec.Class (Step(..), tailRecM)
import Control.Monad.ST.Class (liftST)
import Data.Array (foldM, (!!))
import Data.Array as Array
import Data.Array.NonEmpty (toArray)
import Data.Array.ST as STArray
import Data.Compactable (compact)
import Data.Either (Either(..))
import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (for_)
import Data.FoldableWithIndex (foldrWithIndex)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (unwrap)
import Data.Nullable (Nullable, toMaybe)
import Data.String as String
import Data.String.Regex (match, regex)
import Data.String.Regex.Flags (global)
import Deku.Core (Cb(..), DekuBeacon, DekuChild(..), DekuElement, DekuOutcome(..), DekuParent(..), DekuText, Html(..), Key(..), Nut(..), PSR(..), PursXable(..), Tag(..), Value(..), Verb(..), eltAttribution, fromDekuBeacon, fromDekuElement, fromDekuText, fromDekuTextMarker, handleAtts, toDekuBeacon, toDekuElement, toDekuText, toDekuTextMarker)
import Deku.Core as Core
import Deku.JSWeakRef (WeakRef)
import Deku.Markers as M
import Deku.UnsafeDOM (addEventListener, appendChild, cloneTemplate, createElement, createElementNS, eventListener, insertBefore, outerHTML, removeEventListener, setTextContent, toTemplate, unsafeParentNode)
import Effect (Effect, foreachE)
import Effect.Console (error)
import Effect.Ref (read)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn4, mkEffectFn5, mkEffectFn7, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5)
import Foreign.Object as Object
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)
import Untagged.Union (type (|+|))
import Web.DOM (Element)
import Web.DOM as Node
import Web.DOM.ChildNode (remove)
import Web.DOM.Comment as Comment
import Web.DOM.Document (createComment, createTextNode)
import Web.DOM.Element (getAttribute, removeAttribute, setAttribute, toChildNode, toEventTarget)
import Web.DOM.Element as Element
import Web.DOM.Node (childNodes, firstChild, lastChild, nextSibling, nodeTypeIndex, replaceChild, textContent)
import Web.DOM.NodeList as NodeList
import Web.DOM.ParentNode (QuerySelector(..), querySelectorAll)
import Web.DOM.Text as Text
import Web.Event.Event (EventType(..))
import Web.Event.Event as Web
import Web.Event.EventTarget (EventListener)
import Web.HTML (window)
import Web.HTML.HTMLButtonElement as HTMLButtonElement
import Web.HTML.HTMLDocument (toDocument)
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

makeElementEffect :: Core.MakeElement
makeElementEffect = mkEffectFn2 \ns tag -> do
  elt <- case coerce ns :: Maybe String of
    Nothing -> runEffectFn1 createElement (coerce tag)
    Just ns' -> runEffectFn2 createElementNS (coerce ns') (coerce tag)
  pure $ toDekuElement elt

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
          | i == M.d3kU -> pure $ Loop { n: n + 1, node: nx, cpos }
          -- the current node ends this dyn
          -- so the next node is out of the dyn
          | i == M.uk3D && n == 1 -> pure $ Done { cpos, sb: Just nx }
          -- the current node closes a dyn
          | i == M.uk3D -> pure $ Loop { n: n - 1, node: nx, cpos }
          -- random comment, carry on
          | otherwise -> pure $ Loop { n, node: nx, cpos }
    -- exotic node, carry on
    Just nx, _, _ -> pure $ Loop { n, node: nx, cpos }

doInsertAtEnd' :: Array Node.Node -> DekuBeacon -> Effect Unit
doInsertAtEnd' nd end = do
  let cmnt = Comment.toNode (fromDekuBeacon end)
  x <- runEffectFn1 unsafeParentNode cmnt
  let
    f b a = runEffectFn3 insertBefore a b x $> a
  void $ foldM f cmnt nd

attributeDynParentForArrayOfNodesEffect
  :: EffectFn4 (Array Node.Node) DekuBeacon
       DekuBeacon
       (Maybe Int)
       Unit
attributeDynParentForArrayOfNodesEffect = mkEffectFn4
  \nd start end mpos -> do
    let
      doInsertAtEnd = doInsertAtEnd' nd end
    case mpos of
      Just pos -> do
        let
          go (Left { curSib, cpos }) = do
            if cpos >= pos then do
              x <- runEffectFn1 unsafeParentNode curSib
              let
                f b a = runEffectFn3 insertBefore a b x $> a
              void $ foldM f curSib nd
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
                    pure $ ctext == M.uk3D
                )
                (doInsertAtEnd $> Done unit)
                (Loop <<< Right <$> ffwd { n: 0, node: curSib, cpos })
          go (Right (Loop l)) = Loop <<< Right <$> ffwd l
          go (Right (Done { sb, cpos })) = do
            case sb of
              Just sb' -> do
                pure $ Loop $ Left { curSib: sb', cpos: cpos + 1 }
              Nothing -> doInsertAtEnd $> Done unit
        firstOrEnd <- nextSibling (Comment.toNode (fromDekuBeacon start))
        case firstOrEnd of
          Just st -> tailRecM go $ Left { cpos: 0, curSib: st }
          Nothing -> error
            "Programming error: no boundary found in attributeDynParentForArrayOfNodesEffect"
      Nothing -> doInsertAtEnd

attributeDynParentForArrayOfNodesEffectLucky
  :: EffectFn4 (Array Node.Node) DekuBeacon
       DekuBeacon
       (Maybe Int)
       Unit
attributeDynParentForArrayOfNodesEffectLucky = mkEffectFn4
  \nd start end mpos -> do
    let
      doInsertAtEnd = doInsertAtEnd' nd end
      startNode = Comment.toNode (fromDekuBeacon start)
      endNode = Comment.toNode (fromDekuBeacon end)
    par <- runEffectFn1 unsafeParentNode startNode
    case mpos of
      Just pos -> do
        cn <- childNodes par
        asArr <- NodeList.toArray cn
        let startIx' = Array.findIndex (unsafeRefEq startNode) asArr
        let endIx' = Array.findIndex (unsafeRefEq endNode) asArr
        for_ startIx' \startIx -> for_ endIx' \endIx -> do
          if pos >= (endIx - startIx) then do
            doInsertAtEnd
          else do
            for_ (asArr !! (startIx + 1 + max pos 0)) \nn -> do
              let
                f b a = runEffectFn3 insertBefore a b par $> a
              void $ foldM f nn nd
      _ -> doInsertAtEnd

attributeDynParentForElementEffect :: Core.AttributeDynParentForElement
attributeDynParentForElementEffect = mkEffectFn5
  \lucky (DekuChild child) start end mpos -> do
    l <- read lucky
    if l then runEffectFn4 attributeDynParentForArrayOfNodesEffectLucky
      [ Element.toNode (fromDekuElement child) ]
      start
      end
      mpos
    else runEffectFn4
      attributeDynParentForArrayOfNodesEffect
      [ Element.toNode (fromDekuElement child) ]
      start
      end
      mpos

attributeDynParentForTextEffect :: Core.AttributeDynParentForText
attributeDynParentForTextEffect = mkEffectFn5
  \lucky txt start end mpos -> do
    l <- read lucky
    -- backwards because insertion goes backwards
    let
      nodes =
        [ Comment.toNode (fromDekuTextMarker txt.r)
        , Text.toNode (fromDekuText txt.txt)
        , Comment.toNode (fromDekuTextMarker txt.l)
        ]
    if l then runEffectFn4 attributeDynParentForArrayOfNodesEffectLucky
      nodes
      start
      end
      mpos
    else runEffectFn4
      attributeDynParentForArrayOfNodesEffect
      nodes
      start
      end
      mpos

attributeElementParentEffect :: Core.AttributeElementParent
attributeElementParentEffect = mkEffectFn2
  \(DekuChild child) (DekuParent parent) -> do
    runEffectFn2 appendChild (Element.toNode (fromDekuElement child))
      (Element.toNode (fromDekuElement parent))

attributeTextParentEffect :: Core.AttributeTextParent
attributeTextParentEffect = mkEffectFn2
  \{ l, txt, r } (DekuParent parent) -> do
    let parNode = Element.toNode (fromDekuElement parent)
    runEffectFn2 appendChild (Comment.toNode (fromDekuTextMarker l))
      parNode
    runEffectFn2 appendChild (Text.toNode (fromDekuText txt))
      parNode
    runEffectFn2 appendChild (Comment.toNode (fromDekuTextMarker r))
      parNode

makeOpenBeaconEffect :: Core.MakeOpenBeacon
makeOpenBeaconEffect = do
  doc <- window >>= document
  cm <- createComment M.d3kU (toDocument doc)
  pure (toDekuBeacon cm)

makeCloseBeaconEffect :: Core.MakeCloseBeacon
makeCloseBeaconEffect = mkEffectFn1 \_ -> do
  doc <- window >>= document
  cm <- createComment M.uk3D (toDocument doc)
  pure (toDekuBeacon cm)

attributeBeaconParentEffect :: Core.AttributeBeaconParent
attributeBeaconParentEffect = mkEffectFn2 \beacon (DekuParent parent) -> do
  runEffectFn2 appendChild (Comment.toNode (fromDekuBeacon beacon))
    (Element.toNode (fromDekuElement parent))

attributeDynParentForBeaconsEffect :: Core.AttributeDynParentForBeacons
attributeDynParentForBeaconsEffect = mkEffectFn5
  \i o start end mpos -> do
    let oo = Comment.toNode (fromDekuBeacon o)
    let ii = Comment.toNode (fromDekuBeacon i)
    runEffectFn4 attributeDynParentForArrayOfNodesEffect [ oo ] start end mpos
    x <- runEffectFn1 unsafeParentNode oo
    runEffectFn3 insertBefore ii oo x

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
                    | i == M.d3kU -> pure $ Loop
                        { n: n + 1, node: nx }
                    | i == M.uk3D && n == 0 -> do
                        mover nx
                        pure $ Done unit
                    | i == M.uk3D -> pure $ Loop
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
                  | i == M.d3kU -> pure 1
                  | otherwise -> pure 0
            _ -> pure 0
      tailRecM go { n, node: initial }

attributeBeaconFullRangeParentEffect :: Core.AttributeBeaconFullRangeParent
attributeBeaconFullRangeParentEffect = mkEffectFn2
  \stBeacon (DekuParent parent) -> runEffectFn3
    attributeBeaconFullRangeParentProto
    false
    (\i -> runEffectFn2 appendChild i (Element.toNode (fromDekuElement parent)))
    (Comment.toNode (fromDekuBeacon stBeacon))

attributeDynParentForBeaconFullRangeEffect
  :: Core.AttributeDynParentForBeaconFullRange
attributeDynParentForBeaconFullRangeEffect = mkEffectFn4
  \stBeacon leftB rightB mpos -> do
    nsOld <- nextSibling (Comment.toNode (fromDekuBeacon stBeacon))
    runEffectFn4
      attributeDynParentForArrayOfNodesEffect
      [Comment.toNode (fromDekuBeacon stBeacon)]
      leftB
      rightB
      mpos
    par' <- runEffectFn1 unsafeParentNode
      (Comment.toNode (fromDekuBeacon stBeacon))
    ns <- nextSibling (Comment.toNode (fromDekuBeacon stBeacon))
    case ns, nsOld of
      Just ns', Just nso -> runEffectFn3
        attributeBeaconFullRangeParentProto
        true
        (\i -> runEffectFn3 insertBefore i ns' par')
        nso
      _, _ -> error
        "Programming error: attributeDynParentForBeaconFullRangeEffect cannot find parent"

makeTextEffect :: Core.MakeText
makeTextEffect = mkEffectFn1 \mstr -> do
  doc' <- window >>= document
  let doc = toDocument doc'
  l <- createComment M.tx doc
  txt <- createTextNode (fromMaybe "" mstr) doc
  r <- createComment M.xt doc
  pure $ { l: toDekuTextMarker l, txt: toDekuText txt, r: toDekuTextMarker r }

newtype FeI e = FeI
  { f :: Boolean -> e -> Effect Unit, e :: Element -> Maybe e }

newtype FeO e = FeO { f :: Boolean -> e -> Effect Unit, e :: e }

disableables ∷ List (Exists FeI)
disableables =
  mkExists
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
      , Just ttx <- HTMLTextAreaElement.fromElement elt =
          HTMLTextAreaElement.setValue v ttx
      | k == "checked"
      , Just ie <- HTMLInputElement.fromElement elt =
          HTMLInputElement.setChecked (v == "true") ie
      | k == "disabled"
      , Just fe <-
          getDisableable elt disableables = runExists
          (\(FeO { f, e }) -> f (v == "true") e)
          fe
      | otherwise = setAttribute k v elt
  o

foreign import getPreviousCb
  :: EffectFn2 String DekuElement (Nullable EventListener)

foreign import deletePreviousCb :: EffectFn2 String DekuElement Unit
foreign import setPreviousCb :: EffectFn3 String EventListener DekuElement Unit

setCbEffect :: Core.SetCb
setCbEffect = mkEffectFn3 \elt' (Key k) (Cb v) -> do
  if k == "@self@" then do
    void $ v ((unsafeCoerce :: DekuElement -> Web.Event) elt')
  else do
    l <- runEffectFn2 getPreviousCb k elt'
    let eventType = EventType k
    let eventTarget = toEventTarget (fromDekuElement elt')
    for_ (toMaybe l) \toRemove -> runEffectFn4 removeEventListener eventType
      toRemove
      false
      eventTarget
    nl <- runEffectFn1 eventListener $ mkEffectFn1 v
    runEffectFn4 addEventListener eventType nl false eventTarget
    runEffectFn3 setPreviousCb k nl elt'

unsetAttributeEffect :: Core.UnsetAttribute
unsetAttributeEffect = mkEffectFn2 \elt' (Key k) -> do
  l <- runEffectFn2 getPreviousCb k elt'
  let asElt = fromDekuElement elt'
  let eventType = EventType k
  let eventTarget = toEventTarget asElt
  for_ (toMaybe l) \toRemove -> do
    runEffectFn4 removeEventListener eventType toRemove false eventTarget
    runEffectFn2 deletePreviousCb k elt'
  removeAttribute k asElt

setTextEffect :: Core.SetText
setTextEffect = mkEffectFn2 \txt' str -> do
  let txt = fromDekuText txt'
  runEffectFn2 setTextContent str (Text.toNode txt)

-- for the send pos family of functions
-- we remove first
sendToPosForDynEffect :: Core.SendToPosForDyn
sendToPosForDynEffect = mkEffectFn5 \i b e st ed -> do
  runEffectFn3 removeForDynEffect true b e
  runEffectFn4 attributeDynParentForBeaconFullRangeEffect b st ed (Just i)

sendToPosForElementEffect :: Core.SendToPosForElement
sendToPosForElementEffect = mkEffectFn5 \lucky i b st ed -> do
  runEffectFn2 removeForElementEffect true b
  runEffectFn5 attributeDynParentForElementEffect lucky (DekuChild b) st ed
    (Just i)

sendToPosForTextEffect :: Core.SendToPosForText
sendToPosForTextEffect = mkEffectFn7 \lucky i ml b mr st ed -> do
  runEffectFn4 removeForTextEffect true ml b mr
  runEffectFn5 attributeDynParentForTextEffect lucky { l: ml, txt: b, r: mr } st
    ed
    (Just i)

-- for now ignore isPortal elements
removeForDynEffect :: Core.RemoveForDyn
removeForDynEffect = mkEffectFn3 \fromPortal l ee -> do
  pn <- runEffectFn1 unsafeParentNode (Comment.toNode $ fromDekuBeacon l)
  let
    cond =
      if fromPortal then pure false
      else do
        cn <- childNodes pn
        nl <- NodeList.toArray cn
        case nl !! 1, nl !! (Array.length nl - 2) of
          Just a, Just b -> pure
            ( unsafeRefEq a (Comment.toNode $ fromDekuBeacon l) && unsafeRefEq b
                (Comment.toNode $ fromDekuBeacon ee)
            )
          _, _ -> pure false
  let
    a = do
      fc <- firstChild pn
      lc <- lastChild pn
      case fc, lc of
        Just xx, Just yy -> do
          runEffectFn2 setTextContent "" pn
          runEffectFn2 appendChild xx pn
          runEffectFn2 appendChild yy pn
        _, _ -> error "Programming error: dyn underfull"
  let
    b = do
      e <- runEffectFn2 makeElementEffect Nothing (Tag "div")
      runEffectFn2 attributeBeaconFullRangeParentEffect l (DekuParent e)
  ifM cond a b

removeForElementEffect :: Core.RemoveForElement
removeForElementEffect = mkEffectFn2 \_ e -> do
  remove (toChildNode (fromDekuElement e))

removeForTextEffect :: Core.RemoveForText
removeForTextEffect = mkEffectFn4 \_ l t r -> do
  remove (Text.toChildNode (fromDekuText t))
  remove (Comment.toChildNode (fromDekuTextMarker l))
  remove (Comment.toChildNode (fromDekuTextMarker r))

matchTildes :: String -> Array String
matchTildes nodeContent =
  case regex "~([^~]+)~" global of
    Right r ->
      -- Extract matched content for all matches
      maybe [] (compact <<< toArray) (match r nodeContent)
    Left _ -> []

data ListList a = KeepGoing (List a) (ListList a) | Stop

queryAttrWithParent :: EffectFn2 String Element (Array Node.Node)
queryAttrWithParent = mkEffectFn2 \att me -> do
  nl <- querySelectorAll (QuerySelector ("[" <> att <> "]"))
    (Element.toParentNode me)
  hasAttr <- getAttribute att me
  arr <- NodeList.toArray nl
  pure (maybe arr (Array.snoc arr) (hasAttr $> Element.toNode me))

makePursxEffect :: Core.MakePursx
makePursxEffect = mkEffectFn5
  \(Html html) (Verb verb) replacements ps di -> do
    let
      { foldedHtml, nuts, atts } = foldrWithIndex
        ( \i v r -> case v of
            PXNut n -> r
              { foldedHtml = String.replace (String.Pattern $ verb <> i <> verb)
                  ( String.Replacement $
                      "<span data-deku-elt-internal=\""
                        <> i
                        <>
                          "\"></span>"
                  )
                  r.foldedHtml
              , nuts = Object.insert i n r.nuts
              }
            PXAttr a -> r
              { foldedHtml = String.replace (String.Pattern $ verb <> i <> verb)
                  ( String.Replacement $ "data-deku-attr-internal=\"" <> i <>
                      "\""
                  )
                  r.foldedHtml
              , atts = Object.insert i a r.atts
              }
            PXStr s -> r
              { foldedHtml = String.replace (String.Pattern $ verb <> i <> verb)
                  (String.Replacement $ s)
                  r.foldedHtml
              }
        )
        { atts: Object.empty, nuts: Object.empty, foldedHtml: html }
        replacements
    eltX <- runEffectFn1 toTemplate foldedHtml
    elt <- runEffectFn1 cloneTemplate eltX
    runEffectFn3 eltAttribution ps di (toDekuElement elt)
    arr <- runEffectFn2 queryAttrWithParent "data-deku-attr-internal" elt
    foreachE arr \nd -> do
      case Element.fromNode nd of
        Just asElt -> do
          attTag <- getAttribute "data-deku-attr-internal" asElt
          case attTag >>= flip Object.lookup atts of
            Just att -> do
              star <- liftST $ STArray.new
              -- todo: does this map have a runtime hit?
              handleAtts di (toDekuElement asElt) star
                [ att ]
            Nothing -> do
              error $
                ( "Programming error: att not found in pursx " <> show attTag
                    <> " "
                    <> show (Object.keys atts)
                )
        Nothing -> do
          error $
            "Programming error: non-element with attr-internal tag"
    arrrrrr <- runEffectFn2 queryAttrWithParent "data-deku-elt-internal" elt
    foreachE arrrrrr \nd -> do
      case Element.fromNode nd of
        Just asElt -> do
          eltTag <- getAttribute "data-deku-elt-internal" asElt
          case eltTag >>= flip Object.lookup nuts of
            Just (Nut replacementNode) -> do
              -- todo: does this map have a runtime hit?
              x' <- runEffectFn1 unsafeParentNode (Element.toNode asElt)
              case Element.fromNode x' of
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
                    DekuTextOutcome to -> do
                        let lNode = Comment.toNode (fromDekuTextMarker to.l)
                        let tNode = Text.toNode (fromDekuText to.txt)
                        let rNode = Comment.toNode (fromDekuTextMarker to.r)
                        let pNode = Element.toNode x
                        replaceChild
                          rNode
                          (Element.toNode asElt)
                          pNode
                        runEffectFn3 insertBefore tNode rNode pNode
                        runEffectFn3 insertBefore lNode tNode pNode
                    DekuBeaconOutcome bo -> do
                      runEffectFn3
                        attributeBeaconFullRangeParentProto
                        false
                        ( \i -> runEffectFn3 insertBefore i
                            (Element.toNode asElt)
                            (Element.toNode x)
                        )
                        (Comment.toNode (fromDekuBeacon bo))
                      remove (Element.toChildNode asElt)
                    NoOutcome -> pure unit
            Nothing -> do
              ohtml <- runEffectFn1 outerHTML asElt
              parhtml <- runEffectFn1 outerHTML
                (fromDekuElement (unwrap ps).parent)
              error $
                ( "Programming error: nut not found in pursx " <> show eltTag
                    <> " "
                    <> html
                    <> show (Object.keys atts)
                    <> " "
                    <> show (Object.keys nuts)
                    <> " "
                    <> ohtml
                    <> " @@ "
                    <> parhtml
                )
        Nothing -> do
          error $
            "Programming error: non-element with attr-internal tag"
    pure (toDekuElement elt)
