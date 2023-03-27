module Deku.DOM.Elt.Output where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Output_

output
  :: Event (Attribute Output_)
  -> Array Domable
  -> Domable
output attributes kids = Domable
  ( Element'
      ( DC.elementify "output" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

output_
  :: Array Domable
  -> Domable
output_ = output empty

output__
  :: String
  -> Domable
output__ t = output_ [ DC.text_ t ]
