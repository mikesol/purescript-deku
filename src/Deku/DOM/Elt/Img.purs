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
  :: forall payload
   . Event (Attribute Img_)
  -> Array (Domable payload)
  -> Domable payload
img attributes kids = Domable
  ( Element'
      ( DC.elementify "img" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

img_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
img_ = img empty

img__
  :: forall payload
   . String
  -> Domable payload
img__ t = img_ [ DC.text_ t ]
