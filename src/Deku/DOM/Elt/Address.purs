module Deku.DOM.Elt.Address where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Address_

address
  :: Event (Attribute Address_)
  -> Array Domable
  -> Domable
address attributes kids = Domable
  ( Element'
      ( DC.elementify "address" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

address_
  :: Array Domable
  -> Domable
address_ = address empty

address__
  :: String
  -> Domable
address__ t = address_ [ DC.text_ t ]
