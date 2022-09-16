module Deku.Examples.Docs.Examples.Events where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.Core (vbussed)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

main :: Effect Unit
main = runInBody
  ( vbussed (Proxy :: _ UIEvents) \push event -> do
      let
        countUp :: Event Int
        countUp = fold
          (const (1 + _))
          (pure unit <|> event.buttonClicked)
          (-1)
      D.div_
        [ D.button
            (click_ (push.buttonClicked unit))
            [ text_ "Click" ]
        , D.div_
            [ text
                ( pure "Val: 0" <|>
                    ( append "Val: " <<< show <$> countUp
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
