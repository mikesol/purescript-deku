module Deku.DOM.Elt.Frame where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Frame_

frame
  :: Event (Attribute Frame_)
  -> Array Domable
  -> Domable
frame attributes kids = Domable
  ( Element'
      ( DC.elementify "frame" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

frame_
  :: Array Domable
  -> Domable
frame_ = frame empty

frame__
  :: String
  -> Domable
frame__ t = frame_ [ DC.text_ t ]
