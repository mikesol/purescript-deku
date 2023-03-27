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
  :: Event (Attribute Mask_)
  -> Array Domable
  -> Domable
mask attributes kids = Domable
  ( Element'
      ( DC.elementify "mask" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

mask_
  :: Array Domable
  -> Domable
mask_ = mask empty

mask__
  :: String
  -> Domable
mask__ t = mask_ [ DC.text_ t ]
