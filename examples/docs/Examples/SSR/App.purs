module Deku.Examples.Docs.Examples.SSR.App where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Core (Nut, vbussed)
import FRP.Event (fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

app :: Nut
app = vbussed (Proxy :: _ UIEvents) \push event -> do
  D.div_
    [ D.p_
        [ text_
            """Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load."""
        ]
    , D.button
        (click_ (pure push.buttonClicked))
        [ text_ "Click" ]
    , D.div_
        [ text
            ( pure "Val: 0" <|>
                ( append "Val: " <<< show
                    <$> fold
                      (const (add 1))
                      (pure unit <|> event.buttonClicked)
                      (-1)
                )
            )
        ]
    , D.div_
        [ D.input
            (slider (pure push.sliderMoved))
            []
        , D.div_
            [ text
                ( pure "Val: 50" <|>
                    ( map
                        (append "Val: " <<< show)
                        event.sliderMoved
                    )
                )
            ]
        ]
    ]
