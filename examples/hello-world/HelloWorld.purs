module Deku.Example.HelloWorld where

import Prelude

import Control.Alt (alt)
import Control.Plus (empty)
import Data.Foldable (oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple (Tuple(..))
import Deku.Attribute (cb, xdata, (:=))
import Deku.Control as C
import Deku.Core (Domable, envy)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, bang, bus, filterMap, keepLatest, mapAccum)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)

scene :: forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit)
scene = envy $ bus $ \push -> lcmap (alt (bang true)) \event -> do
  D.div_
    [ D.div_
        [ D.div empty [ C.text (bang "Stops after 4 clicks") ]
        , C.text (event <#> if _ then "click " else "kcilc ")
        , D.button
            ( counter event
                # filterMap
                    (\(Tuple x y) -> if y < 4 then Just x else Nothing)
                # map
                    ( \e ->
                        oneOfMap bang
                          [ D.Style := "background-color: rgb(160,234,203);"
                          , D.OnClick := cb (const $ push (not e))
                          , xdata "hello" "world"
                          ]

                    )
                # keepLatest
            )
            [ C.text_ "me" ]
        ]
    , D.input (bang $ D.Autofocus := "") []
    ]

main :: Effect Unit
main = runInBody scene
