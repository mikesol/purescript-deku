module Main where

import Prelude

import Data.Either (Either(..))
import Data.Filterable (compact, partitionMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, bus, mapAccum, sampleOn)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value)

main :: Effect Unit
main = runInBody1
  ( bus \push event -> do
      let
        top =
          [ D.input
              ( oneOfMap bang
                  [ D.OnInput := cb \e -> for_
                      ( target e
                          >>= fromEventTarget
                      )
                      ( value
                          >=> push <<< Right
                      )
                  ]
              )
              []
          , D.button
              (bang $ D.OnClick := push (Left unit))
              [ text_ "Finalize text" ]
          ]
        events = partitionMap identity event
        current = sampleOn events.right (events.left $> identity)
        previous = compact $ mapAccum (\a b -> Just a /\ b) current Nothing
      D.div_
        [ D.div_ top
        , D.div_ [ text (("Current value: " <> _) <$> current) ]
        , D.div_ [ text (("Previous value: " <> _) <$> previous) ]
        ]
  )
