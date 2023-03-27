module Deku.DOM.Elt.Rt where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Rt_

rt
  :: Event (Attribute Rt_)
  -> Array Domable
  -> Domable
rt attributes kids = Domable
  ( Element'
      ( DC.elementify "rt" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rt_
  :: Array Domable
  -> Domable
rt_ = rt empty

rt__
  :: String
  -> Domable
rt__ t = rt_ [ DC.text_ t ]
