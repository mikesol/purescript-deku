module Deku.Example.Docs.Scene where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (switcher, text_)
import Deku.Core (Domable, bussed)
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
import Deku.Example.Docs.Types (Page(..), Options)
import Web.Event.Event (preventDefault)

scene :: forall r l p. { | Options r } -> Domable l p
scene options = bussed \push -> lcmap (pure options.startsWith <|> _)
  \event -> do
    let
      page :: _ -> _ -> Domable l p
      page dpage i = go i { dpage, slug: options.slug }

      go :: _ -> _ -> Domable l p
      go Intro = Intro.intro
      go HelloWorld = HelloWorld.helloWorld
      go SimpleComponent = Component.components
      go PURSX1 = Pursx1.pursx1
      go Events = Events.events
      go Effects = Effects.effects
      go PURSX2 = Pursx2.pursx2
      go Events2 = Events2.events2
      go Portals = Portals1.portals1
      go SSR = SSR.ssrPage
    D.div_
      [ D.div_
          $ map
              ( \(x /\ y /\ pg /\ z) -> D.span_
                  [ D.a
                      ( oneOfMap pure
                          [ D.OnClick := cb (\e -> preventDefault e *> push x)
                          , D.Style := "cursor:pointer;"
                          , D.Href := options.slug <> pg
                          ]
                      )
                      [ text_ y ]
                  , D.span
                      ( pure $ D.Style :=
                          if z then ""
                          else "display:none;"
                      )
                      [ text_ " | " ]
                  ]
              )
          $
            [ Intro
                /\ "Home"
                /\ ""
                /\ true
            , HelloWorld
                /\ "Hello world"
                /\ "hello/"
                /\ true
            , SimpleComponent
                /\ "Component"
                /\ "simple/"
                /\ true
            , PURSX1
                /\ "Pursx 1"
                /\ "pursx1/"
                /\ true
            , Events
                /\ "Events 1"
                /\ "events1/"
                /\ true
            , Effects
                /\ "Effects"
                /\ "effects/"
                /\ true
            , PURSX2
                /\ "Pursx 2"
                /\ "pursx2/"
                /\ true
            , Events2
                /\ "Events 2"
                /\ "events2/"
                /\ true
            , Portals
                /\ "Portals"
                /\ "portals/"
                /\ true
            , SSR
                /\ "SSR"
                /\ "ssr/"
                /\ false
            ]
      , switcher (page push) event
      ]
