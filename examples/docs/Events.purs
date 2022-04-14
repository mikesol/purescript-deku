module Deku.Example.Docs.Events where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (class Plus)
import Data.Exists (mkExists)
import Data.Filterable (filter, filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (flatten, text, text_)
import Deku.Core (Element, SubgraphF(..))
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Deku.Subgraph (SubgraphAction(..), (@@))
import Effect (Effect)
import FRP.Event (class IsEvent, mapAccum)
import FRP.Event.Class (bang)
import Type.Proxy (Proxy(..))
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

data UIEvents = UIShown | ButtonClicked | SliderMoved Number
derive instance Eq UIEvents
px = Proxy :: Proxy
      """<div>
  <h1>Events</h1>

  <h2>Listening to the DOM</h2>
  <p>
    We'll spice up the previous example by adding an event listener to our button. When we do, Deku will keep track of how many times we clicked it. The same goes for a range slider, whose current value is displayed underneath it.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h1>Event handling</h1>
  <p>All DOM event handlers, like <code>OnClick</code> and <code>OnInput</code>, can be set with a value of type <code>Cb</code>. This type is a newtype around <code>(Event -> Effect Boolean)</code>. In order to actually trigger the event, you'll use the <code>push</code> function passed to the creation function. The push function has a signature of <code>(push -> Effect Unit)</code>. Here, the type one can push in to <code>push</code> is UIEvents. Whenever a push happens, our `Event` receives it and all attributes are updated accordingly.</p>

  <h1>Attribute updates</h1>
  <p>In Deku, attributes are `Event`-s. This means that, when you send something to `push`, if you want an attribute to change, the event being pushed to needs to be used to create the attribute event. That's what's happening in our example: the event is used <i>both</i> to control the click and the range slider.</p>

  <p>If every attribute responded to every event, Deku would become very slow. Thankfully, there's a solution. `Event` implements the `Filterable` typeclass, and when you filter an `Event`, you mute the filtered-out parts for downstream consumers.</p>

  <h2>Next steps</h2>
  <p>In this section, saw how to react to events. In the next section, we'll use a similar mechanism to deal with arbitrary <a ~next~ style="cursor:pointer;">effects</a>.</p>
</div>"""

events :: forall event payload. IsEvent event => Plus event => (Page -> Effect Unit) -> Element event payload
events dpage = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filter, filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Toplevel ((🚀))
import Effect (Effect)
import FRP.Event (mapAccum)
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

data UIEvents = UIShown | ButtonClicked | SliderMoved Number
derive instance Eq UIEvents

main :: Effect Unit
main = UIShown 🚀 \push event ->
  D.div_
    [ D.button
        (bang (D.OnClick := cb (const $ push ButtonClicked)))
        [ text_ "Click" ]
    , D.div_
        [ text
            ( (bang "Val: 0") <|>
                ( mapAccum (const $ \x -> (x + 1) /\ x)
                    (filter (eq ButtonClicked) event)
                    0
                    # map (append "Val: " <<< show)
                )
            )
        ]
    , D.div_
        [ D.input
            ( oneOfMap bang
                [ D.Xtype := "range"
                , D.OnInput := cb \e -> for_
                    ( target e
                        >>= fromEventTarget
                        >>= fromElement
                    )
                    ( valueAsNumber
                        >=> push <<< SliderMoved
                    )
                ]
            )
            []
        , D.div_
            [ text
                ( (bang "Val: 50") <|>
                    ( filterMap
                        ( case _ of
                            SliderMoved n -> Just n
                            _ -> Nothing
                        )
                        event
                        # map (append "Val: " <<< show)
                    )
                )
            ]
        ]
    ]
"""
              ]
          ]
      )
  , result: nut
      ( bang (unit /\ Insert) @@ \_ -> mkExists $ SubgraphF \push event ->
            flatten
              [ D.button
                  (bang (D.OnClick := cb (const $ push ButtonClicked)))
                  [ text_ "Click" ]
              , D.div_
                  [ text
                      ( (bang "Val: 0") <|>
                          ( mapAccum (const $ \x -> (x + 1) /\ x)
                              (filter (eq ButtonClicked) event)
                              1
                              # map (append "Val: " <<< show)
                          )
                      )
                  ]
              , D.div_
                  [ D.input
                      ( oneOfMap bang
                          [ D.Xtype := "range"
                          , D.OnInput := cb \e -> for_
                              ( target e
                                  >>= fromEventTarget
                                  >>= fromElement
                              )
                              ( valueAsNumber
                                  >=> push <<< SliderMoved
                              )
                          ]
                      )
                      []
                  , D.div_
                      [ text
                          ( (bang "Val: 50") <|>
                              ( filterMap
                                  ( case _ of
                                      SliderMoved n -> Just n
                                      _ -> Nothing
                                  )
                                  event
                                  # map (append "Val: " <<< show)
                              )
                          )
                      ]
                  ]
              ]
      )
  , next: bang (D.OnClick := (cb (const $ dpage Effects *> scrollToTop)))
  }