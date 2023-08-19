module Deku.Example.HelloWorld where

import Prelude

import Control.Alt (alt)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple (Tuple(..))
import Deku.Attribute (xdata)
import Deku.Control as C
import Deku.Core (Nut, bus)
import Deku.Core as CC
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, filterMap, keepLatest, mapAccum)
import Web.HTML (HTMLDivElement)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f 0 event
  where
  f a b = Tuple (a + 1) (Tuple b a)

scene :: Nut
scene = CC.envy $ bus $ \push -> lcmap (alt (pure true)) \event -> do
  D.div_
    [ D.div_
        [ D.div
            [ DL.injectElementT \( _ :: HTMLDivElement ) -> pure unit
            ]
            [ C.text (pure "Stops after 4 clicks") ]
        , C.text (event <#> if _ then "click " else "kcilc ")
        , D.button
            [ counter event
                # filterMap
                    (\(Tuple x y) -> if y < 4 then Just x else Nothing)
                # map
                    ( \e ->
                        oneOf
                        [ DA.style_ $ "background-color: rgb(160,234,203);"
                        , DL.click_ \_ -> push (not e)
                        , pure $ xdata "hello" "world"
                        ]

                    )
                # keepLatest
            ]
            [ C.text_ "me" ]
        ]
    , D.input [ DA.autofocus_ "" ] []
    ]

main :: Effect Unit
main = runInBody scene
