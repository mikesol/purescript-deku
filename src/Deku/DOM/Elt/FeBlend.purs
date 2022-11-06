module Deku.DOM.Elt.FeBlend where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeBlend_

feBlend
  :: forall lock payload
   . Event (Attribute FeBlend_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feBlend attributes kids = Domable
  ( Element'
      ( elementify "feBlend" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feBlend_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feBlend_ = feBlend empty
