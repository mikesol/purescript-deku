module Deku.Example.HelloWorld where

import Prelude

import Control.Alt (alt)
import Data.Profunctor (lcmap)
import Data.Tuple (Tuple(..))
import Deku.Attribute (cb, (:=))
import Deku.Control as C
import Deku.Core (Domable, M, bussed)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (AnEvent, bang, keepLatest, mapAccum)

counter :: forall a. AnEvent M a → AnEvent M (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)

scene :: forall lock payload. Domable lock payload
scene = bussed $ \push -> lcmap (alt $ bang 0) \event ->
  D.div_
    [ D.span_
      [ C.text (event <#> show)
      ]
    , D.button
        ( event
            # map
                (\e -> bang $ D.OnClick := cb (const $ push (e + 1)))
            # keepLatest
        )
        [ C.text_ "Click Me" ]
    ]

main :: Effect Unit
main = runInBody scene
