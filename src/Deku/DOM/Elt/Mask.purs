module Deku.DOM.Elt.Mask where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Mask_

mask
  :: forall lock payload
   . Event (Attribute Mask_)
  -> Array (Domable lock payload)
  -> Domable lock payload
mask attributes kids = Domable
  ( Element'
      ( elementify "mask" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

mask_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
mask_ = mask empty
