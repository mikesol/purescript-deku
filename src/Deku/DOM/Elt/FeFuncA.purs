module Deku.DOM.Elt.FeFuncA where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncA_

feFuncA
  :: Event (Attribute FeFuncA_)
  -> Array Domable
  -> Domable
feFuncA attributes kids = Domable
  ( Element'
      ( DC.elementify "feFuncA" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncA_
  :: Array Domable
  -> Domable
feFuncA_ = feFuncA empty

feFuncA__
  :: String
  -> Domable
feFuncA__ t = feFuncA_ [ DC.text_ t ]
