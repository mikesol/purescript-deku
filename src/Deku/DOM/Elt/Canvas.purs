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
  :: forall lock payload
   . Event (Attribute Canvas_)
  -> Array (Domable lock payload)
  -> Domable lock payload
canvas attributes kids = Domable
  ( Element'
      ( DC.elementify "canvas" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

canvas_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
canvas_ = canvas empty

canvas__
  :: forall lock payload
   . String
  -> Domable lock payload
canvas__ t = canvas_ [ DC.text_ t ]
