module Deku.Examples.Docs.Examples.Events where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (fold)
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
                        ( append "Val: " <<< show
                            <$> event.sliderMoved
                        )
                    )
                ]
            ]
        ]
  )
