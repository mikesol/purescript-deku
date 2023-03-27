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
  :: forall payload
   . Event (Attribute Output_)
  -> Array (Domable payload)
  -> Domable payload
output attributes kids = Domable
  ( Element'
      ( DC.elementify "output" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

output_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
output_ = output empty

output__
  :: forall payload
   . String
  -> Domable payload
output__ t = output_ [ DC.text_ t ]
