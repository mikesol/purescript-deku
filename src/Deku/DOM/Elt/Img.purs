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
  :: forall lock payload
   . Event (Attribute Img_)
  -> Array (Domable lock payload)
  -> Domable lock payload
img attributes kids = Domable
  ( Element'
      ( DC.elementify "img" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

img_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
img_ = img empty

img__
  :: forall lock payload
   . String
  -> Domable lock payload
img__ t = img_ [ DC.text_ t ]
