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
  :: forall lock payload
   . Event (Attribute Output_)
  -> Array (Domable lock payload)
  -> Domable lock payload
output attributes kids = Domable
  ( Element'
      ( DC.elementify "output" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

output_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
output_ = output empty


output__
  :: forall lock payload
   . String
  -> Domable lock payload
output__ t = output_ [ DC.text_ t ]
