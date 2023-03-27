module Deku.DOM.Elt.Marker where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Marker_

marker
  :: Event (Attribute Marker_)
  -> Array Domable
  -> Domable
marker attributes kids = Domable
  ( Element'
      ( DC.elementify "marker" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

marker_
  :: Array Domable
  -> Domable
marker_ = marker empty

marker__
  :: String
  -> Domable
marker__ t = marker_ [ DC.text_ t ]
