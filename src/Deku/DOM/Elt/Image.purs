module Deku.DOM.Elt.Image where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Image_

image
  :: forall payload
   . Event (Attribute Image_)
  -> Array (Domable payload)
  -> Domable payload
image attributes kids = Domable
  ( Element'
      ( DC.elementify "image" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

image_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
image_ = image empty

image__
  :: forall payload
   . String
  -> Domable payload
image__ t = image_ [ DC.text_ t ]
