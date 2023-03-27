module Deku.DOM.Elt.Hr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Hr_

hr
  :: forall payload
   . Event (Attribute Hr_)
  -> Array (Domable payload)
  -> Domable payload
hr attributes kids = Domable
  ( Element'
      ( DC.elementify "hr" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

hr_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
hr_ = hr empty

hr__
  :: forall payload
   . String
  -> Domable payload
hr__ t = hr_ [ DC.text_ t ]
