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
  :: Event (Attribute FeColorMatrix_)
  -> Array Domable
  -> Domable
feColorMatrix attributes kids = Domable
  ( Element'
      ( DC.elementify "feColorMatrix" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feColorMatrix_
  :: Array Domable
  -> Domable
feColorMatrix_ = feColorMatrix empty

feColorMatrix__
  :: String
  -> Domable
feColorMatrix__ t = feColorMatrix_ [ DC.text_ t ]
