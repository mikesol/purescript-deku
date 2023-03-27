module Deku.DOM.Elt.Dd where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dd_

dd
  :: Event (Attribute Dd_)
  -> Array Domable
  -> Domable
dd attributes kids = Domable
  ( Element'
      ( DC.elementify "dd" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dd_
  :: Array Domable
  -> Domable
dd_ = dd empty

dd__
  :: String
  -> Domable
dd__ t = dd_ [ DC.text_ t ]
