module Deku.DOM.Elt.FeConvolveMatrix where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeConvolveMatrix_

feConvolveMatrix
  :: forall lock payload
   . Event (Attribute FeConvolveMatrix_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feConvolveMatrix attributes kids = Domable
  ( Element'
      ( DC.elementify "feConvolveMatrix" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feConvolveMatrix_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feConvolveMatrix_ = feConvolveMatrix empty

feConvolveMatrix__
  :: forall lock payload
   . String
  -> Domable lock payload
feConvolveMatrix__ t = feConvolveMatrix_ [ DC.text_ t ]
