module Deku.Example.Docs.Events where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOfMap)
import Deku.Attribute (cb, (:=))
import Deku.Control (vbussed, text, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..), PageOptions)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Listeners (click_, slider)
import Deku.Pursx (nut, (~~))
import FRP.Event (bang, fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))
import Web.Event.Event (preventDefault)

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

px =
  Proxy    :: Proxy         """<div>
  <h1>Events</h1>

  <h2>Listening to the DOM</h2>
  <p>
    We'll spice up the previous example by adding an event listener to our button. When we do, Deku will keep track of how many times we clicked it. The same goes for a range slider, whose current value is displayed underneath it.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Event handling</h2>
  <p>All DOM event handlers, like <code>OnClick</code> and <code>OnInput</code>, can be set with a value of type <code>Cb</code>. This type is a <code>newtype</code> around <code>(Event -> Effect Boolean)</code>. To hook the event up to the Deku event bus, you can use the <code>push</code> function within the event handler. The push function has a signature of <code>(push -> Effect Unit)</code>. Here, the type one can push in to <code>push</code> is UIEvents. Whenever a push happens, our <code>Event</code> receives it and all attributes are updated accordingly.</p>

  <h2>Next steps</h2>
  <p>In this section, saw how to react to events. In the next section, we'll use a similar mechanism to deal with arbitrary <a ~next~ style="cursor:pointer;">effects</a>.</p>
</div>"""

events :: forall r. {|PageOptions r}  -> Nut
events options = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, fold)
import FRP.Event.VBus (V, vbus)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

main :: Effect Unit
main = runInBody1
  ( vbus (Proxy :: _ UIEvents) \push event -> do
      D.div_
        [ D.button
            (click_ (bang push.buttonClicked))
            [ text_ "Click" ]
        , D.div_
            [ text
                ( bang "Val: 0" <|>
                    ( append "Val: " <<< show
                        <$> fold
                          (const (add 1))
                          (bang unit <|> event.buttonClicked)
                          (-1)
                    )
                )
            ]
        , D.div_
            [ D.input
                (slider (bang push.sliderMoved))
                []
            , D.div_
                [ text
                    ( bang "Val: 50.0" <|>
                        ( append "Val: " <<< show
                            <$> event.sliderMoved
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
      ( vbussed (Proxy :: _ UIEvents) \push event -> do
          D.div_
            [ D.button
                (click_ (bang push.buttonClicked))
                [ text_ "Click" ]
            , D.div_
                [ text
                    ( bang "Val: 0" <|>
                        ( append "Val: " <<< show
                            <$> fold
                              (const (add 1))
                              (bang unit <|> event.buttonClicked)
                              (-1)
                        )
                    )
                ]
            , D.div_
                [ D.input
                    (slider (bang push.sliderMoved))
                    []
                , D.div_
                    [ text
                        ( (bang "Val: 50.0") <|>
                            ( (append "Val: " <<< show) <$> event.sliderMoved
                            )
                        )
                    ]
                ]
            ]
      )
  , next: oneOfMap bang [D.OnClick := (cb (\e -> preventDefault e *> options.dpage Effects *> scrollToTop) ), D.Href := (options.slug <> "effects/") ]
  }