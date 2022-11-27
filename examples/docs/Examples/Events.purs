module Deku.Examples.Docs.Examples.Events where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Hooks (useState)
import Deku.Do as Deku
import Deku.Listeners (click_, slider)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, fold)

main :: Effect Unit
main = runInBody Deku.do
  setButtonClicked /\ buttonClicked <- useState unit
  setSliderMoved /\ sliderMoved <- useState 50.0
  let
    countUp :: Event Int
    countUp = fold (\a _ -> 1 + a) (-1) buttonClicked
  D.div_
    [ D.button
        (click_ (setButtonClicked unit))
        [ text_ "Click" ]
    , D.div_
        [ text
            (("Val: " <> _) <<< show <$> countUp)
        ]
    , D.div_
        [ D.input
            (slider (pure setSliderMoved))
            []
        , D.div_
            [ text
                (("Val: " <> _) <<< show <$> sliderMoved)
            ]
        ]
    ]
