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
  :: forall payload
   . Event (Attribute Address_)
  -> Array (Domable payload)
  -> Domable payload
address attributes kids = Domable
  ( Element'
      ( DC.elementify "address" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

address_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
address_ = address empty

address__
  :: forall payload
   . String
  -> Domable payload
address__ t = address_ [ DC.text_ t ]
