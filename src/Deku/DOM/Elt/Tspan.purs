module Deku.DOM.Elt.Tspan where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tspan_

tspan
  :: forall payload
   . Event (Attribute Tspan_)
  -> Array (Domable payload)
  -> Domable payload
tspan attributes kids = Domable
  ( Element'
      ( DC.elementify "tspan" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tspan_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
tspan_ = tspan empty

tspan__
  :: forall payload
   . String
  -> Domable payload
tspan__ t = tspan_ [ DC.text_ t ]
