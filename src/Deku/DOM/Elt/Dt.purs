module Deku.DOM.Elt.Dt where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dt_

dt
  :: forall payload
   . Event (Attribute Dt_)
  -> Array (Domable payload)
  -> Domable payload
dt attributes kids = Domable
  ( Element'
      ( DC.elementify "dt" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dt_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
dt_ = dt empty

dt__
  :: forall payload
   . String
  -> Domable payload
dt__ t = dt_ [ DC.text_ t ]
