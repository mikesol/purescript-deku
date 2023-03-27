module Deku.DOM.Elt.U where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data U_

u
  :: forall payload
   . Event (Attribute U_)
  -> Array (Domable payload)
  -> Domable payload
u attributes kids = Domable
  ( Element'
      ( DC.elementify "u" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

u_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
u_ = u empty

u__
  :: forall payload
   . String
  -> Domable payload
u__ t = u_ [ DC.text_ t ]
