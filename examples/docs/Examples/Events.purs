module Deku.Examples.Docs.Examples.Events where

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
import FRP.Event (mapAccum, bus, bang)
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
