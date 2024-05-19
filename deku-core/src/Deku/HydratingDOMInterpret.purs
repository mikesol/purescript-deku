module Deku.HydratingDOMInterpret where

import Prelude

import Control.Monad.Rec.Class (Step(..), tailRecM)
import Data.Maybe (Maybe(..))
import Data.Traversable (traverse)
import Data.Tuple (Tuple(..))
import Deku.Core (toDekuElement)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Interpret as I
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Ref as Ref
import Effect.Uncurried (mkEffectFn2, mkEffectFn3, mkEffectFn4, mkEffectFn5, mkEffectFn7)
import Web.DOM (Element, Node)
import Web.DOM.Element (fromNode, toNode, toNonDocumentTypeChildNode, toParentNode)
import Web.DOM.Node (parentElement)
import Web.DOM.NonDocumentTypeChildNode (nextElementSibling)
import Web.DOM.ParentNode (firstElementChild)

-- ascendParents :: Node -> Effect (Maybe Element)
-- ascendParents = tailRecM f
--   where
--   f :: Node -> Effect (Step Node (Maybe Element))
--   f nd = parentElement nd >>= case _ of
--     Just x -> nextElementSibling (toNonDocumentTypeChildNode x) >>= case _ of
--       Just nx -> pure $ Done (Just nx)
--       Nothing -> pure $ Loop (toNode x)
--     Nothing -> pure $ Done Nothing

-- makeElementHydrate :: Ref.Ref (Maybe Node) -> Core.MakeElement
-- makeElementHydrate nodeRef = mkEffectFn2 \_ _ -> do
--   nx <- Ref.read nodeRef
--   Tuple nx' e <- case nx of
--     Just nx' -> Tuple nx' <$> do
--       ee <- join <$> traverse firstElementChild (toParentNode <$> fromNode nx')
--       case ee of
--         Just fc -> pure $ Just fc
--         Nothing -> do
--           yy <- join <$> traverse nextElementSibling (toNonDocumentTypeChildNode <$> fromNode nx')
--           case yy of
--             Just sx' -> pure $ Just sx'
--             Nothing -> ascendParents nx'
--     Nothing -> throwException $ error "makeElementHydrate: nodeRef is empty"
--   Ref.write (toNode <$> e) nodeRef
--   pure $ toDekuElement nx'

hydratingDOMInterpret :: Ref.Ref (Maybe Node) -> Core.DOMInterpret
hydratingDOMInterpret nodeRef = Core.DOMInterpret
  { makeElement: I.makeElementEffect -- nodeRef
  , setProp: mkEffectFn3 \_ _ _ -> pure unit
  , setCb: I.setCbEffect
  , unsetAttribute: mkEffectFn2 \_ _ -> pure unit
  , attributeElementParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , sendToPosForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , removeForElement: mkEffectFn2 \_ _ -> pure unit
  --
  , makeOpenBeacon: I.makeOpenBeaconEffect --
  , makeCloseBeacon: I.makeCloseBeaconEffect --
  , attributeBeaconParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForBeacons: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , attributeBeaconFullRangeParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForBeaconFullRange: mkEffectFn4 \_ _ _ _ -> pure unit
  , sendToPosForDyn: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , removeForDyn: mkEffectFn3 \_ _ _ -> pure unit
  --
  , makeText: I.makeTextEffect --
  , setText: mkEffectFn2 \_ _ -> pure unit
  , attributeTextParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForText: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , sendToPosForText: mkEffectFn7 \_ _ _ _ _ _ _ -> pure unit
  , removeForText: mkEffectFn4 \_ _ _ _ -> pure unit
  --
  , makePursx: I.makePursxEffect --
  --
  , next: \_ -> fullDOMInterpret
  }