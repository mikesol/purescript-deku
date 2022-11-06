module Deku.DOM.Elt.FeMorphology where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeMorphology_

feMorphology
  :: forall lock payload
   . Event (Attribute FeMorphology_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feMorphology attributes kids = Domable
  ( Element'
      ( elementify "feMorphology" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMorphology_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feMorphology_ = feMorphology empty
