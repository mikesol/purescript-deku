module Deku.DOM.Elt.Rt where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Rt_

rt
  :: forall lock payload
   . Event (Attribute Rt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rt attributes kids = Domable
  ( Element'
      ( elementify "rt" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rt_ = rt empty

