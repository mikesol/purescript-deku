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
  :: forall payload
   . Event (Attribute Details_)
  -> Array (Domable payload)
  -> Domable payload
details attributes kids = Domable
  ( Element'
      ( DC.elementify "details" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

details_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
details_ = details empty

details__
  :: forall payload
   . String
  -> Domable payload
details__ t = details_ [ DC.text_ t ]
