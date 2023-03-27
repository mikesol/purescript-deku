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
  :: Event (Attribute Canvas_)
  -> Array Domable
  -> Domable
canvas attributes kids = Domable
  ( Element'
      ( DC.elementify "canvas" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

canvas_
  :: Array Domable
  -> Domable
canvas_ = canvas empty

canvas__
  :: String
  -> Domable
canvas__ t = canvas_ [ DC.text_ t ]
