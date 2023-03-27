module Deku.DOM.Elt.FeMerge where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeMerge_

feMerge
  :: Event (Attribute FeMerge_)
  -> Array Domable
  -> Domable
feMerge attributes kids = Domable
  ( Element'
      ( DC.elementify "feMerge" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMerge_
  :: Array Domable
  -> Domable
feMerge_ = feMerge empty

feMerge__
  :: String
  -> Domable
feMerge__ t = feMerge_ [ DC.text_ t ]
