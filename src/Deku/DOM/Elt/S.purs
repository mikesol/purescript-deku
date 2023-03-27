module Deku.DOM.Elt.S where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data S_

s
  :: Event (Attribute S_)
  -> Array Domable
  -> Domable
s attributes kids = Domable
  ( Element'
      ( DC.elementify "s" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

s_
  :: Array Domable
  -> Domable
s_ = s empty

s__
  :: String
  -> Domable
s__ t = s_ [ DC.text_ t ]
