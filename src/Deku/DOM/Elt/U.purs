module Deku.DOM.Elt.U where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data U_

u
  :: Event (Attribute U_)
  -> Array Domable
  -> Domable
u attributes kids = Domable
  ( Element'
      ( DC.elementify "u" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

u_
  :: Array Domable
  -> Domable
u_ = u empty

u__
  :: String
  -> Domable
u__ t = u_ [ DC.text_ t ]
