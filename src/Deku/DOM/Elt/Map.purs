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
  :: forall lock payload
   . Event (Attribute Map_)
  -> Array (Domable lock payload)
  -> Domable lock payload
map attributes kids = Domable
  ( Element'
      ( DC.elementify "map" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

map_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
map_ = map empty

map__
  :: forall lock payload
   . String
  -> Domable lock payload
map__ t = map_ [ DC.text_ t ]
