module Deku.DOM.Elt.Polyline where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Polyline_

polyline
  :: Event (Attribute Polyline_)
  -> Array Domable
  -> Domable
polyline attributes kids = Domable
  ( Element'
      ( DC.elementify "polyline" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

polyline_
  :: Array Domable
  -> Domable
polyline_ = polyline empty

polyline__
  :: String
  -> Domable
polyline__ t = polyline_ [ DC.text_ t ]
