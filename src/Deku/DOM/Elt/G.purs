module Deku.DOM.Elt.G where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data G_

g
  :: Event (Attribute G_)
  -> Array Domable
  -> Domable
g attributes kids = Domable
  ( Element'
      ( DC.elementify "g" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

g_
  :: Array Domable
  -> Domable
g_ = g empty

g__
  :: String
  -> Domable
g__ t = g_ [ DC.text_ t ]
