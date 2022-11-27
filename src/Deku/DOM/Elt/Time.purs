module Deku.DOM.Elt.Time where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Time_

time
  :: forall lock payload
   . Event (Attribute Time_)
  -> Array (Domable lock payload)
  -> Domable lock payload
time attributes kids = Domable
  ( Element'
      ( DC.elementify "time" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

time_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
time_ = time empty


time__
  :: forall lock payload
   . String
  -> Domable lock payload
time__ t = time_ [ DC.text_ t ]
