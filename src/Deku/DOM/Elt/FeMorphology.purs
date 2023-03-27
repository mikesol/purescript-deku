module Deku.DOM.Elt.FeMorphology where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeMorphology_

feMorphology
  :: forall payload
   . Event (Attribute FeMorphology_)
  -> Array (Domable payload)
  -> Domable payload
feMorphology attributes kids = Domable
  ( Element'
      ( DC.elementify "feMorphology" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMorphology_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feMorphology_ = feMorphology empty

feMorphology__
  :: forall payload
   . String
  -> Domable payload
feMorphology__ t = feMorphology_ [ DC.text_ t ]
