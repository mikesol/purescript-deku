module Deku.DOM.Elt.Img where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Img_

img
  :: Event (Attribute Img_)
  -> Array Domable
  -> Domable
img attributes kids = Domable
  ( Element'
      ( DC.elementify "img" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

img_
  :: Array Domable
  -> Domable
img_ = img empty

img__
  :: String
  -> Domable
img__ t = img_ [ DC.text_ t ]
