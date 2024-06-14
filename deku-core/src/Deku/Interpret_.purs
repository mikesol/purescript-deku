-- | This module is for internal use only, and should only be consulted by people
-- | implementing a Deku backend. It is not part of the public API, and does not yet
-- | have documentation. If you are not implementing a Deku backend, please ping
-- | the #frp channel of the PureScript Discord. If enough people are implementing
-- | Deku backends, someone may document this stuff at some point.
module Deku.Interpret where

import Prelude

import Control.Monad.Rec.Class (Step(..), tailRecM)
import Data.Array ((!!))
import Data.Array as Array
import Data.Array.NonEmpty (toArray)
import Data.Compactable (compact)
import Data.Either (Either(..))
import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (for_)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Nullable (Nullable, toMaybe)
import Data.String.Regex (match, regex)
import Data.String.Regex.Flags (global)
import Deku.Core (Cb(..), Key(..), Tag(..), Value(..))
import Deku.Core as Core
import Deku.Internal.Entities (fromDekuElement, toDekuElement)
import Deku.UnsafeDOM (addEventListener, appendChild, createElement, createElementNS, eventListener, insertBefore, removeEventListener, setTextContent, unsafeParentNode)
import Deku.UnsafeDOM as Unsafe
import Effect (Effect)
import Effect.Console (error)
import Effect.Ref (read)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn4, mkEffectFn5, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)
import Web.DOM (Element)
import Web.DOM as Node
import Web.DOM.ChildNode (remove)
import Web.DOM.Comment as Comment
import Web.DOM.Document (createComment, createTextNode)
import Web.DOM.Element (getAttribute, removeAttribute, setAttribute, toChildNode, toEventTarget)
import Web.DOM.Element as Element
import Web.DOM.Node (childNodes, firstChild, lastChild, nextSibling, nodeTypeIndex, textContent)
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
import Web.HTML.HTMLTemplateElement as HTMLTemplateElement
import Web.HTML.HTMLTextAreaElement as HTMLTextAreaElement
import Web.HTML.Window (document)


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

doInsertAtEnd' :: Node.Node -> DekuBeacon -> Effect Unit
doInsertAtEnd' nd end = do
  x <- runEffectFn1 unsafeParentNode (Comment.toNode (fromDekuBeacon end))
  runEffectFn3 insertBefore nd
    (Comment.toNode (fromDekuBeacon end))
    x

attributeDynParentForNodeEffect
  :: EffectFn4 Node.Node DekuBeacon
       DekuBeacon
       (Maybe Int)
       Unit
attributeDynParentForNodeEffect = mkEffectFn4
  \nd start end mpos -> do
    let
      doInsertAtEnd = doInsertAtEnd' nd end
    case mpos of
      Just pos -> do
        let
          go (Left { curSib, cpos }) = do
            if cpos >= pos then do
              x <- runEffectFn1 unsafeParentNode curSib
              runEffectFn3 insertBefore nd curSib x
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
            "Programming error: no boundary found in attributeDynParentForNodeEffect"
      Nothing -> doInsertAtEnd

attributeDynParentForNodeEffectLucky
  :: EffectFn4 Node.Node DekuBeacon
       DekuBeacon
       (Maybe Int)
       Unit
attributeDynParentForNodeEffectLucky = mkEffectFn4
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
            for_ (asArr !! (startIx + 1 + max pos 0)) \nn ->
              runEffectFn3 insertBefore nd nn par
      _ -> doInsertAtEnd

attributeDynParentForElementEffect :: Core.AttributeDynParentForElement
attributeDynParentForElementEffect = mkEffectFn5
  \lucky (DekuChild child) start end mpos -> do
    l <- read lucky
    if l then runEffectFn4 attributeDynParentForNodeEffectLucky
      (Element.toNode (fromDekuElement child))
      start
      end
      mpos
    else runEffectFn4
      attributeDynParentForNodeEffect
      (Element.toNode (fromDekuElement child))
      start
      end
      mpos

attributeDynParentForTextEffect :: Core.AttributeDynParentForText
attributeDynParentForTextEffect = mkEffectFn5
  \lucky txt start end mpos -> do
    l <- read lucky
    if l then runEffectFn4 attributeDynParentForNodeEffectLucky
      (Text.toNode (fromDekuText txt))
      start
      end
      mpos
    else runEffectFn4
      attributeDynParentForNodeEffect
      (Text.toNode (fromDekuText txt))
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
  \txt (DekuParent parent) -> do
    runEffectFn2 appendChild (Text.toNode (fromDekuText txt))
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
  runEffectFn2 appendChild (Comment.toNode (fromDekuBeacon beacon))
    (Element.toNode (fromDekuElement parent))

attributeDynParentForBeaconsEffect :: Core.AttributeDynParentForBeacons
attributeDynParentForBeaconsEffect = mkEffectFn5
  \i o start end mpos -> do
    let oo = Comment.toNode (fromDekuBeacon o)
    let ii = Comment.toNode (fromDekuBeacon i)
    runEffectFn4 attributeDynParentForNodeEffect oo start end mpos
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
    (\i -> runEffectFn2 appendChild i (Element.toNode (fromDekuElement parent)))
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


foreign import getPreviousCb
  :: EffectFn2 String DekuElement (Nullable EventListener)

foreign import deletePreviousCb :: EffectFn2 String DekuElement Unit
foreign import setPreviousCb :: EffectFn3 String EventListener DekuElement Unit

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
sendToPosForTextEffect = mkEffectFn5 \lucky i b st ed -> do
  runEffectFn2 removeForTextEffect true b
  runEffectFn5 attributeDynParentForTextEffect lucky b st ed (Just i)

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

matchTildes :: String -> Array String
matchTildes nodeContent =
  case regex "~([^~]+)~" global of
    Right r ->
      -- Extract matched content for all matches
      maybe [] (compact <<< toArray) (match r nodeContent)
    Left _ -> []

queryAttrWithParent :: EffectFn2 String Element (Array Node.Node)
queryAttrWithParent = mkEffectFn2 \att me -> do
  nl <- querySelectorAll (QuerySelector ("[" <> att <> "]"))
    (Element.toParentNode me)
  hasAttr <- getAttribute att me
  arr <- NodeList.toArray nl
  pure (maybe arr (Array.snoc arr) (hasAttr $> Element.toNode me))
