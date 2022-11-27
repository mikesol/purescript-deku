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
  :: forall lock payload
   . Event (Attribute U_)
  -> Array (Domable lock payload)
  -> Domable lock payload
u attributes kids = Domable
  ( Element'
      ( DC.elementify "u" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

u_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
u_ = u empty

u__
  :: forall lock payload
   . String
  -> Domable lock payload
u__ t = u_ [ DC.text_ t ]
