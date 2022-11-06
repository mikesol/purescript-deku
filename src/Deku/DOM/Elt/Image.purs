module Deku.DOM.Elt.Image where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Image_

image
  :: forall lock payload
   . Event (Attribute Image_)
  -> Array (Domable lock payload)
  -> Domable lock payload
image attributes kids = Domable
  ( Element'
      ( elementify "image" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

image_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
image_ = image empty
