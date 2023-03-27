module Deku.DOM.Elt.FeDisplacementMap where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDisplacementMap_

feDisplacementMap
  :: Event (Attribute FeDisplacementMap_)
  -> Array Domable
  -> Domable
feDisplacementMap attributes kids = Domable
  ( Element'
      ( DC.elementify "feDisplacementMap" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDisplacementMap_
  :: Array Domable
  -> Domable
feDisplacementMap_ = feDisplacementMap empty

feDisplacementMap__
  :: String
  -> Domable
feDisplacementMap__ t = feDisplacementMap_ [ DC.text_ t ]
