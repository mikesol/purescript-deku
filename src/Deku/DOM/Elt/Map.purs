module Deku.DOM.Elt.Map where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Map_

map
  :: Event (Attribute Map_)
  -> Array Domable
  -> Domable
map attributes kids = Domable
  ( Element'
      ( DC.elementify "map" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

map_
  :: Array Domable
  -> Domable
map_ = map empty

map__
  :: String
  -> Domable
map__ t = map_ [ DC.text_ t ]
