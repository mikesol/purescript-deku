module Deku.HydratingDOMInterpret where

import Prelude

import Control.Monad.Rec.Class (Step(..), tailRecM)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Debug (spy)
import Deku.Core (fromDekuBeacon, fromDekuElement, toDekuBeacon, toDekuElement, toDekuText, toDekuTextMarker)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Interpret as I
import Deku.Markers as M
import Deku.UnsafeDOM (insertBefore)
import Effect (Effect)
import Effect.Console (log)
import Effect.Exception (error, throwException)
import Effect.Ref as Ref
import Effect.Uncurried (mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn4, mkEffectFn5, mkEffectFn7, runEffectFn2, runEffectFn3, runEffectFn5)
import Web.DOM (Node)
import Web.DOM.Comment as Cmt
import Web.DOM.Document (createTextNode)
import Web.DOM.Element as Elt
import Web.DOM.Node (firstChild, nextSibling, parentNode, replaceChild, textContent)
import Web.DOM.Node as Node
import Web.DOM.Text as Txt
import Web.HTML (window)
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.Window (document)

nextSiblingIgnoringCloseBeacon :: Node -> Effect (Maybe Node)
nextSiblingIgnoringCloseBeacon = tailRecM f
  where
  f q = nextSibling q >>= case _ of
    Just x -> case Cmt.fromNode x of
      Just _ -> do
        tc <- Node.textContent x
        if tc == M.uk3D then pure $ Loop x
        else pure $ Done $ Just x
      Nothing -> pure $ Done $ Just x
    Nothing -> pure $ Done Nothing

ascendParents :: Node -> Effect (Maybe Node)
ascendParents = tailRecM f
  where
  f :: Node -> Effect (Step Node (Maybe Node))
  f nd = parentNode nd >>= case _ of
    Just x -> nextSiblingIgnoringCloseBeacon x >>= case _ of
      Just nx -> pure $ Done (Just nx)
      Nothing -> pure $ Loop x
    Nothing -> pure $ Done Nothing

getNextNode :: Node -> Effect (Maybe Node)
getNextNode n = firstChild n >>= case _ of
  Just x -> pure $ Just x
  Nothing -> nextSiblingIgnoringCloseBeacon n >>= case _ of
    Just y -> pure $ Just y
    Nothing -> ascendParents n

makeElementHydrate :: Ref.Ref (Maybe Node) -> Core.MakeElement
makeElementHydrate nodeRef = mkEffectFn2 \_ _ -> do
  nx <- Ref.read nodeRef
  let _ = spy "NX elt" nx
  Tuple nx' nn <- case nx >>= Elt.fromNode of
    Just y -> Tuple y <$> getNextNode (Elt.toNode y)
    _ -> throwException $ error "makeElementHydrate not element"
  Ref.write nn nodeRef
  pure $ toDekuElement nx'

makeOpenBeaconHydrate :: Ref.Ref (Maybe Node) -> Core.MakeOpenBeacon
makeOpenBeaconHydrate nodeRef = do
  nx <- Ref.read nodeRef
  let _ = spy "NX beacon" nx
  Tuple nx' nn <- case nx >>= Cmt.fromNode of
    Just y -> do
      t <- Node.textContent (Cmt.toNode y)
      if t == M.d3kU then Tuple y <$> getNextNode (Cmt.toNode y)
      else throwException $ error ("makeOpenBeaconHydrate wrong text: " <> t)
    _ -> throwException $ error "makeOpenBeaconHydrate not comment"
  Ref.write nn nodeRef
  pure $ toDekuBeacon nx'

makeCloseBeaconHydrate :: Ref.Ref (Maybe Node) -> Core.MakeCloseBeacon
makeCloseBeaconHydrate _ = mkEffectFn1 \db ->
  toDekuBeacon <$> tailRecM f { n: 0, nd: Cmt.toNode $ fromDekuBeacon db }
  where
  f { n, nd } = do
    nx <- nextSibling nd
    case nx of
      Just y -> case Cmt.fromNode y of
        Just ct -> do
          tc <- Node.textContent y
          pure $
            if tc == M.uk3D && n == 0 then Done ct
            else if tc == M.uk3D then Loop { n: n - 1, nd: y }
            else if tc == M.d3kU then Loop { n: n + 1, nd: y }
            else Loop { n, nd: y }
        Nothing -> pure $ Loop { n, nd: y }
      Nothing -> throwException $ error
        "makeCloseBeaconHydrate could not find next sibling"

makeTextHydrate :: Ref.Ref (Maybe Node) -> Core.MakeText
makeTextHydrate nodeRef = mkEffectFn1 \_ -> do
  nx <- Ref.read nodeRef
  let _ = spy "NX text" nx
  Tuple nx' nn <- case nx >>= Cmt.fromNode of
    Just y -> do
      let cnd = Cmt.toNode y
      t <- Node.textContent cnd
      if t == M.tx then do
        ntx <- nextSibling cnd
        let _ = spy "found next txt sibling" ntx
        case ntx >>= Txt.fromNode of
          Just txt -> do
            nc <- nextSibling (Txt.toNode txt)
            case nc >>= Cmt.fromNode of
              Just yy ->
                Tuple
                  { l: toDekuTextMarker y
                  , txt: toDekuText txt
                  , r: toDekuTextMarker yy
                  } <$>
                  getNextNode (Cmt.toNode yy)
              Nothing -> throwException $ error
                ("could not find closing comment")
          Nothing -> case ntx >>= Cmt.fromNode of
            Just cmt -> do
              tct <- textContent (Cmt.toNode cmt)
              if tct == M.xt then do
                doc' <- window >>= document
                let doc = toDocument doc'
                tnd <- createTextNode "" doc
                cp <- parentNode (Cmt.toNode cmt)
                case cp of
                  Just cp' -> do
                    runEffectFn3 insertBefore (Txt.toNode tnd) (Cmt.toNode cmt)
                      cp'
                    Tuple
                      { l: toDekuTextMarker y
                      , txt: toDekuText tnd
                      , r: toDekuTextMarker cmt
                      } <$> getNextNode (Cmt.toNode cmt)
                  Nothing -> throwException $ error
                    ("could not find parent for comment node")
              else throwException $ error
                ("incoherent close")
            Nothing -> throwException $ error
              ("makeTextHydrate could not find text node after comment")
      else throwException $ error
        ("makeOpmakeTextHydrateenBeaconHydrate wrong text: " <> t)
    _ -> throwException $ error "makeTextHydrate not comment"
  Ref.write nn nodeRef
  pure nx'

makePursxHydrate :: Ref.Ref (Maybe Node) -> Core.MakePursx
makePursxHydrate nodeRef = mkEffectFn5 \a b c d e -> do
  nx <- Ref.read nodeRef
  let _ = spy "NX pursx" nx
  Tuple nx' nn <- case nx >>= Cmt.fromNode of
    Just y -> do
      let cnd = Cmt.toNode y
      t <- Node.textContent cnd
      if t == M.pursx then do
        px <- runEffectFn5 I.makePursxEffect a b c d e
        p <- parentNode cnd
        let ev = Elt.toNode $ fromDekuElement px
        case p of
          Just p' -> do
            replaceChild
              ev
              cnd
              p'
            nxx <- getNextNode ev
            pure $ Tuple px nxx
          Nothing -> throwException $ error
            "could not find parent for pursx marker"
      else throwException $ error
        ("makePursxHydrate wrong text: " <> t)
    _ -> throwException $ error "makePursxHydrate not comment"
  Ref.write nn nodeRef
  pure nx'

hydratingDOMInterpret :: Ref.Ref (Maybe Node) -> Core.DOMInterpret
hydratingDOMInterpret nodeRef = Core.DOMInterpret
  { makeElement: makeElementHydrate nodeRef
  , setProp: I.setPropBase mempty
  , setCb: I.setCbEffect
  , unsetAttribute: mkEffectFn2 \_ _ -> pure unit
  , attributeElementParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , sendToPosForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , removeForElement: mkEffectFn2 \_ _ -> pure unit
  --
  , makeOpenBeacon: makeOpenBeaconHydrate nodeRef
  , makeCloseBeacon: makeCloseBeaconHydrate nodeRef
  , attributeBeaconParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForBeacons: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , attributeBeaconFullRangeParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForBeaconFullRange: mkEffectFn4 \_ _ _ _ -> pure unit
  , sendToPosForDyn: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , removeForDyn: mkEffectFn3 \_ _ _ -> pure unit
  --
  , makeText: makeTextHydrate nodeRef
  , setText: mkEffectFn2 \_ _ -> pure unit
  , attributeTextParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForText: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , sendToPosForText: mkEffectFn7 \_ _ _ _ _ _ _ -> pure unit
  , removeForText: mkEffectFn4 \_ _ _ _ -> pure unit
  --
  , makePursx: makePursxHydrate nodeRef
  --
  , next: \_ -> fullDOMInterpret
  }