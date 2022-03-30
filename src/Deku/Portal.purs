module Deku.Portal where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Deku.Core (DOMInterpret(..), Element_, Subgraph_)
import FRP.Behavior (sample_)
import FRP.Event (Event, keepLatest)

type GatewayToSubgraph index env push =
  forall dom engine
   . (Event Boolean -> Element_ dom engine)
  -> Subgraph_ index env push dom engine

type GatewayToElement =
  forall dom engine
   . (Event Boolean -> Element_ dom engine)
  -> Element_ dom engine

portal
  :: forall dom engine
   . Element_ dom engine
  -> ((Event Boolean -> Element_ dom engine) -> Element_ dom engine)
  -> Element_ dom engine
portal elt cf parent di@(DOMInterpret { ids, makePortal }) = keepLatest
  ( (sample_ ids (pure unit)) <#> \portalId ->
      let
        cont = cf
          \eb par (DOMInterpret { ids: ids2, makeGateway, setPortal }) ->
            keepLatest
              ( (sample_ ids2 (pure unit)) <#> \gatewayId ->
                  pure
                    ( makeGateway
                        { id: gatewayId, parent: par, portal: portalId }
                    )
                    <|> map (setPortal <<< { id: gatewayId, on: _ }) eb
              )
      in
        oneOf $
          [ pure $ makePortal { id: portalId }
          , elt portalId di -- this element's parent is the portal
          , cont parent di -- this elements parent is the given parent
          ]
  )