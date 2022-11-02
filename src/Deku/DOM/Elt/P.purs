module Deku.DOM.Elt.P where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data P_

p
  :: forall lock payload
   . Event (Attribute P_)
  -> Array (Domable lock payload)
  -> Domable lock payload
p attributes kids = Domable
  ( Element'
      ( elementify "p" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

p_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
p_ = p empty

