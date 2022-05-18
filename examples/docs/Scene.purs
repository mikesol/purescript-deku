module Deku.Example.Docs.Scene where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOfMap)
import Data.Monoid.Always (always)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (switcher, text_)
import Deku.Core (bussed)
import Deku.DOM as D
import Deku.Example.Docs.Component as Component
import Deku.Example.Docs.Effects as Effects
import Deku.Example.Docs.Events as Events
import Deku.Example.Docs.Events2 as Events2
import Deku.Example.Docs.HelloWorld as HelloWorld
import Deku.Example.Docs.Intro as Intro
import Deku.Example.Docs.Portals1 as Portals1
import Deku.Example.Docs.Pursx1 as Pursx1
import Deku.Example.Docs.Pursx2 as Pursx2
import Deku.Example.Docs.SSR as SSR
import Deku.Example.Docs.Types (Page(..))
import Deku.TLDW (Nut)
import FRP.Event (bang)

scene :: Nut
scene = bussed $ (lcmap (map always)) \push -> lcmap (bang Intro <|> _)
  \event ->
    D.div_
      [ D.div_
          $ map
              ( \(x /\ y /\ z) -> D.span_
                  [ D.a
                      ( oneOfMap bang
                          [ D.OnClick := cb (const $ push x)
                          , D.Style := "cursor:pointer;"
                          ]
                      )
                      [ text_ y ]
                  , D.span
                      ( bang $ D.Style :=
                          if z then ""
                          else "display:none;"
                      )
                      [ text_ " | " ]
                  ]
              )
          $
            [ Intro
                /\ "Home"
                /\ true
            , HelloWorld
                /\ "Hello world"
                /\ true
            , SimpleComponent
                /\ "Component"
                /\ true
            , PURSX1
                /\ "Pursx 1"
                /\ true
            , Events
                /\ "Events 1"
                /\ true
            , Effects
                /\ "Effects"
                /\ true
            , PURSX2
                /\ "Pursx 2"
                /\ true
            , Events2
                /\ "Events 2"
                /\ true
            , Portals
                /\ "Portals"
                /\ true
            , SSR
                /\ "SSR"
                /\ false
            ]
      , D.div_ [ switcher (page push) event ]
      ]
  where
  page dpage Intro = Intro.intro dpage
  page dpage HelloWorld = HelloWorld.helloWorld dpage
  page dpage SimpleComponent = Component.components dpage
  page dpage PURSX1 = Pursx1.pursx1 dpage
  page dpage Events = Events.events dpage
  page dpage Effects = Effects.effects dpage
  page dpage PURSX2 = Pursx2.pursx2 dpage
  page dpage Events2 = Events2.events2 dpage
  page dpage Portals = Portals1.portals1 dpage
  page dpage SSR = SSR.ssrPage dpage
