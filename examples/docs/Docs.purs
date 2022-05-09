module Deku.Example.Docs where

import Prelude

import Data.Foldable (for_, oneOfMap)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (dekuA, switcher, text_)
import Deku.Core (Domable)
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
import Deku.Example.Docs.Types (Page(..))
import Deku.Interpret (effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (Event, bang, create, mapAccum, subscribe)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

counter :: forall a. Event a → Event (a /\ Int)
counter event = mapAccum f event 0
  where
  f a b = (b + 1) /\ (a /\ b)

scene
  :: forall lock payload
   . (Page -> Effect Unit)
  -> Event Page
  -> Array (Domable Effect lock payload)
scene push event =
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
            /\ false
        ]
  , D.div_ [ switcher (page push) event ]
  ]
  where
  page :: (Page -> Effect Unit) -> Page -> Domable Effect lock payload
  page dpage Intro = Intro.intro dpage
  page dpage HelloWorld = HelloWorld.helloWorld dpage
  page dpage SimpleComponent = Component.components dpage
  page dpage PURSX1 = Pursx1.pursx1 dpage
  page dpage Events = Events.events dpage
  page dpage Effects = Effects.effects dpage
  page dpage PURSX2 = Pursx2.pursx2 dpage
  page dpage Events2 = Events2.events2 dpage
  page dpage Portals = Portals1.portals1 dpage

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    { push, event } <- create
    let evt = dekuA b (scene push event) effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
    push Intro