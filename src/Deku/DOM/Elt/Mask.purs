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
  :: forall payload
   . Event (Attribute Mask_)
  -> Array (Domable payload)
  -> Domable payload
mask attributes kids = Domable
  ( Element'
      ( DC.elementify "mask" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

mask_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
mask_ = mask empty

mask__
  :: forall payload
   . String
  -> Domable payload
mask__ t = mask_ [ DC.text_ t ]
