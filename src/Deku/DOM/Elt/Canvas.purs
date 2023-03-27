module Deku.DOM.Elt.Canvas where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Canvas_

canvas
  :: forall payload
   . Event (Attribute Canvas_)
  -> Array (Domable payload)
  -> Domable payload
canvas attributes kids = Domable
  ( Element'
      ( DC.elementify "canvas" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

canvas_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
canvas_ = canvas empty

canvas__
  :: forall payload
   . String
  -> Domable payload
canvas__ t = canvas_ [ DC.text_ t ]
