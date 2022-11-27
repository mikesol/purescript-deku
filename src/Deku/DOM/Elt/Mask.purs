module Deku.DOM.Elt.Mask where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
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
      ( DC.elementify "mask" attributes
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

mask__
  :: forall lock payload
   . String
  -> Domable lock payload
mask__ t = mask_ [ DC.text_ t ]
