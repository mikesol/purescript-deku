module Deku.DOM.Elt.H2 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H2_

h2
  :: Event (Attribute H2_)
  -> Array Domable
  -> Domable
h2 attributes kids = Domable
  ( Element'
      ( DC.elementify "h2" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h2_
  :: Array Domable
  -> Domable
h2_ = h2 empty

h2__
  :: String
  -> Domable
h2__ t = h2_ [ DC.text_ t ]
