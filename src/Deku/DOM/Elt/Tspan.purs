module Deku.DOM.Elt.Tspan where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tspan_

tspan
  :: Event (Attribute Tspan_)
  -> Array Domable
  -> Domable
tspan attributes kids = Domable
  ( Element'
      ( DC.elementify "tspan" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tspan_
  :: Array Domable
  -> Domable
tspan_ = tspan empty

tspan__
  :: String
  -> Domable
tspan__ t = tspan_ [ DC.text_ t ]
