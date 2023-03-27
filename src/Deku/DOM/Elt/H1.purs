module Deku.DOM.Elt.H1 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H1_

h1
  :: Event (Attribute H1_)
  -> Array Domable
  -> Domable
h1 attributes kids = Domable
  ( Element'
      ( DC.elementify "h1" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h1_
  :: Array Domable
  -> Domable
h1_ = h1 empty

h1__
  :: String
  -> Domable
h1__ t = h1_ [ DC.text_ t ]
