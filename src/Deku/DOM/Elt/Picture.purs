module Deku.DOM.Elt.Picture where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Picture_

picture
  :: forall payload
   . Event (Attribute Picture_)
  -> Array (Domable payload)
  -> Domable payload
picture attributes kids = Domable
  ( Element'
      ( DC.elementify "picture" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

picture_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
picture_ = picture empty

picture__
  :: forall payload
   . String
  -> Domable payload
picture__ t = picture_ [ DC.text_ t ]
