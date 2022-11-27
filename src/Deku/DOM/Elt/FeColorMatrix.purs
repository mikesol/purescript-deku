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
  :: forall lock payload
   . Event (Attribute FeColorMatrix_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feColorMatrix attributes kids = Domable
  ( Element'
      ( DC.elementify "feColorMatrix" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feColorMatrix_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feColorMatrix_ = feColorMatrix empty

feColorMatrix__
  :: forall lock payload
   . String
  -> Domable lock payload
feColorMatrix__ t = feColorMatrix_ [ DC.text_ t ]
