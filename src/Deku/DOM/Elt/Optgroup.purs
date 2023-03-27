module Deku.DOM.Elt.Optgroup where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Optgroup_

optgroup
  :: Event (Attribute Optgroup_)
  -> Array Domable
  -> Domable
optgroup attributes kids = Domable
  ( Element'
      ( DC.elementify "optgroup" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

optgroup_
  :: Array Domable
  -> Domable
optgroup_ = optgroup empty

optgroup__
  :: String
  -> Domable
optgroup__ t = optgroup_ [ DC.text_ t ]
