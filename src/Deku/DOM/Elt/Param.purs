module Deku.DOM.Elt.Param where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Param_

param
  :: forall lock payload
   . Event (Attribute Param_)
  -> Array (Domable lock payload)
  -> Domable lock payload
param attributes kids = Domable
  ( Element'
      ( elementify "param" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

param_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
param_ = param empty

