module Deku.DOM.Elt.Stop where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Stop_

stop
  :: Event (Attribute Stop_)
  -> Array Domable
  -> Domable
stop attributes kids = Domable
  ( Element'
      ( DC.elementify "stop" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

stop_
  :: Array Domable
  -> Domable
stop_ = stop empty

stop__
  :: String
  -> Domable
stop__ t = stop_ [ DC.text_ t ]
