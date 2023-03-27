module Deku.DOM.Elt.Center where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Center_

center
  :: Event (Attribute Center_)
  -> Array Domable
  -> Domable
center attributes kids = Domable
  ( Element'
      ( DC.elementify "center" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

center_
  :: Array Domable
  -> Domable
center_ = center empty

center__
  :: String
  -> Domable
center__ t = center_ [ DC.text_ t ]
