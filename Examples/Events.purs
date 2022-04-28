module Deku.Examples.Docs.Examples.Events where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (for_, oneOfMap)
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, plant, text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, fold)
import FRP.Event.VBus (V, vbus)
import Type.Proxy (Proxy(..))
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

type UIEvents = V
  ( uiShow :: Unit
  , buttonClicked :: Unit
  , sliderMoved :: Number
  )

main :: Effect Unit
main = runInBody1
  ( vbus (Proxy :: _ UIEvents) \push event -> plant do
      D.div_
        [ D.button
            ( bang
                ( D.OnClick := push.buttonClicked unit)
            )
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
                ( oneOfMap bang
                    [ D.Xtype := "range"
                    , D.OnInput := cb \e -> for_
                        ( target e
                            >>= fromEventTarget
                            >>= fromElement
                        )
                        ( valueAsNumber
                            >=> push.sliderMoved
                        )
                    ]
                )
                blank
            , D.div_
                [ text
                    ( bang "Val: 50" <|>
                        ( append "Val: " <<< show
                            <$> event.sliderMoved
                        )
                    )
                ]
            ]
        ]
  )
