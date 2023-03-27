module Deku.DOM.Elt.Details where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Details_

details
  :: Event (Attribute Details_)
  -> Array Domable
  -> Domable
details attributes kids = Domable
  ( Element'
      ( DC.elementify "details" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

details_
  :: Array Domable
  -> Domable
details_ = details empty

details__
  :: String
  -> Domable
details__ t = details_ [ DC.text_ t ]
