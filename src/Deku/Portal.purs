module Deku.Portal where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Deku.Core (DOMInterpret(..), Element(..), Subgraph)
import FRP.Behavior (sample_)
import FRP.Event (class IsEvent, Event, keepLatest)

type GatewayToSubgraph index env push =
  forall event payload
   . (Event Boolean -> Element event payload)
  -> Subgraph index env push event payload

type GatewayToElement =
  forall event payload
   . (Event Boolean -> Element event payload)
  -> Element event payload

portal
  :: forall event payload
   . IsEvent event
  => Element event payload
  -> ((event Boolean -> Element event payload) -> Element event payload)
  -> Element event payload
portal elt cf = Element go
  where
  go parent di@(DOMInterpret { ids, makePortal }) = keepLatest
    ( (sample_ ids (pure unit)) <#> \portalId ->
        let
          cont = cf
            \eb ->
              let
                gogo par (DOMInterpret { ids: ids2, makeGateway, setPortal }) =
                  keepLatest
                    ( (sample_ ids2 (pure unit)) <#> \gatewayId ->
                        pure
                          ( makeGateway
                              { id: gatewayId, parent: par, portal: portalId }
                          )
                          <|> map (setPortal <<< { id: gatewayId, on: _ }) eb
                    )
              in
                Element gogo

        in
          oneOf $
            [ pure $ makePortal { id: portalId }
            , (let Element y = elt in y) portalId
                di -- this element's parent is the portal
            , (let Element y = cont in y) parent
                di -- this elements parent is the given parent
            ]
    )