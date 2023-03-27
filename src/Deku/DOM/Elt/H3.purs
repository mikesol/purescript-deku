module Deku.DOM.Elt.H3 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H3_

h3
  :: Event (Attribute H3_)
  -> Array Domable
  -> Domable
h3 attributes kids = Domable
  ( Element'
      ( DC.elementify "h3" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h3_
  :: Array Domable
  -> Domable
h3_ = h3 empty

h3__
  :: String
  -> Domable
h3__ t = h3_ [ DC.text_ t ]
