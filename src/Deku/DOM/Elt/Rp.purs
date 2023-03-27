module Deku.DOM.Elt.Rp where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Rp_

rp
  :: Event (Attribute Rp_)
  -> Array Domable
  -> Domable
rp attributes kids = Domable
  ( Element'
      ( DC.elementify "rp" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rp_
  :: Array Domable
  -> Domable
rp_ = rp empty

rp__
  :: String
  -> Domable
rp__ t = rp_ [ DC.text_ t ]
