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
  :: Event (Attribute FeConvolveMatrix_)
  -> Array Domable
  -> Domable
feConvolveMatrix attributes kids = Domable
  ( Element'
      ( DC.elementify "feConvolveMatrix" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feConvolveMatrix_
  :: Array Domable
  -> Domable
feConvolveMatrix_ = feConvolveMatrix empty

feConvolveMatrix__
  :: String
  -> Domable
feConvolveMatrix__ t = feConvolveMatrix_ [ DC.text_ t ]
