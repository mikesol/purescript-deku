module Deku.DOM.Elt.Small where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Small_

small
  :: Event (Attribute Small_)
  -> Array Domable
  -> Domable
small attributes kids = Domable
  ( Element'
      ( DC.elementify "small" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

small_
  :: Array Domable
  -> Domable
small_ = small empty

small__
  :: String
  -> Domable
small__ t = small_ [ DC.text_ t ]
