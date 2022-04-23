module Deku.Example.Docs.Events where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filter, filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, text, text_)
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import FRP.Event (bang, mapAccum, bus)
import Type.Proxy (Proxy(..))
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

data UIEvents = UIShown | ButtonClicked | SliderMoved Number
derive instance Eq UIEvents
px =
  Proxy    :: Proxy      """<div>
  <h1>Events</h1>

  <h2>Listening to the DOM</h2>
  <p>
    We'll spice up the previous example by adding an event listener to our button. When we do, Deku will keep track of how many times we clicked it. The same goes for a range slider, whose current value is displayed underneath it.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>The bus system</h2>

  <p>The function <code>bus</code> in this example can be used to create an <i>ad hoc</i> event bus. Its signature is:</p>

  <pre><code>bus
    :: forall a r
    . ((a -> Effect Unit)
    -> Event a -> r)
    -> Event r
</code></pre>

  <p>Note that <code>bus</code> returns an <code>Event</code>, so it needs to be consumed by something that accepts events. The function <code>runInBody1</code> accepts an argument of type <code>(forall lock. Event (Element lock payload))</code>, whereas <code>runInBody2</code> that we saw in the previous examples accepts an argument of type <code>(forall lock. Element lock payload)</code>. We'll go over the <code>runInBodyX</code> family of functions when we explore events in greater detail.</p>

  <h2>Event handling</h2>
  <p>All DOM event handlers, like <code>OnClick</code> and <code>OnInput</code>, can be set with a value of type <code>Cb</code>. This type is a <code>newtype</code> around <code>(Event -> Effect Boolean)</code>. To hook the event up to the Deku event bus, you can use the <code>push</code> function within the event handler. The push function has a signature of <code>(push -> Effect Unit)</code>. Here, the type one can push in to <code>push</code> is UIEvents. Whenever a push happens, our <code>Event</code> receives it and all attributes are updated accordingly.</p>

  <h2>Next steps</h2>
  <p>In this section, saw how to react to events. In the next section, we'll use a similar mechanism to deal with arbitrary <a ~next~ style="cursor:pointer;">effects</a>.</p>
</div>"""

events :: forall lock payload. (Page -> Effect Unit) -> Element lock payload
events dpage = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Control.Alt (alt, (<|>))
import Data.Filterable (filter, filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (mapAccum, bang, bus)
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

data UIEvents = UIShown | ButtonClicked | SliderMoved Number
derive instance Eq UIEvents

main :: Effect Unit
main = runInBody1
  ( bus \push -> lcmap (alt (bang UIShown)) \event -> do
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
                blank
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
"""
              ]
          ]
      )
  , result: nut
      ( bus \push event ->
          D.div_
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
                    blank
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