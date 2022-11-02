module Deku.DOM.Elt.Area where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Area_

area
  :: forall lock payload
   . Event (Attribute Area_)
  -> Array (Domable lock payload)
  -> Domable lock payload
area attributes kids = Domable
  ( Element'
      ( elementify "area" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

area_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
area_ = area empty

