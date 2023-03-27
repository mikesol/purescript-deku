module Deku.DOM.Elt.A where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data A_

a
  :: Event (Attribute A_)
  -> Array Domable
  -> Domable
a attributes kids = Domable
  ( Element'
      ( DC.elementify "a" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

a_
  :: Array Domable
  -> Domable
a_ = a empty

a__
  :: String
  -> Domable
a__ t = a_ [ DC.text_ t ]
