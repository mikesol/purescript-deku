module Deku.DOM.Elt.Meter where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Meter_

meter
  :: forall payload
   . Event (Attribute Meter_)
  -> Array (Domable payload)
  -> Domable payload
meter attributes kids = Domable
  ( Element'
      ( DC.elementify "meter" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

meter_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
meter_ = meter empty

meter__
  :: forall payload
   . String
  -> Domable payload
meter__ t = meter_ [ DC.text_ t ]
