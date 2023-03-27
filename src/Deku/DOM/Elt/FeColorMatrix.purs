module Deku.DOM.Elt.FeColorMatrix where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeColorMatrix_

feColorMatrix
  :: forall payload
   . Event (Attribute FeColorMatrix_)
  -> Array (Domable payload)
  -> Domable payload
feColorMatrix attributes kids = Domable
  ( Element'
      ( DC.elementify "feColorMatrix" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feColorMatrix_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feColorMatrix_ = feColorMatrix empty

feColorMatrix__
  :: forall payload
   . String
  -> Domable payload
feColorMatrix__ t = feColorMatrix_ [ DC.text_ t ]
