module Deku.Example.HelloWorld where

import Prelude

import Control.Alt (alt)
import Control.Plus (empty)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple (Tuple(..))
import Deku.Attribute (xdata)
import Deku.Control as C
import Deku.Core (Nut, bus)
import Deku.Core as CC
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, filterMap, keepLatest, mapAccum)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f 0 event
  where
  f a b = Tuple (a + 1) (Tuple b a)

scene :: Nut
scene = CC.envy $ bus $ \push -> lcmap (alt (pure true)) \event -> do
  D.div_
    [ D.div_
        [ D.div empty [ C.text (pure "Stops after 4 clicks") ]
        , C.text (event <#> if _ then "click " else "kcilc ")
        , D.button
            [counter event
                # filterMap
                    (\(Tuple x y) -> if y < 4 then Just x else Nothing)
                # map
                    ( \e ->
                        oneOf
                        [ D._style_ $ "background-color: rgb(160,234,203);"
                        , D._onClick_ $ const $ push (not e)
                        , pure $ xdata "hello" "world"
                        ]

                    )
                # keepLatest
            ]
            [ C.text_ "me" ]
        ]
    , D.input [ D._autofocus_ "" ] []
    ]

main :: Effect Unit
main = runInBody scene
