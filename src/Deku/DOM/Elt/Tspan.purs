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
  :: forall lock payload
   . Event (Attribute Tspan_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tspan attributes kids = Domable
  ( Element'
      ( DC.elementify "tspan" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tspan_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tspan_ = tspan empty

tspan__
  :: forall lock payload
   . String
  -> Domable lock payload
tspan__ t = tspan_ [ DC.text_ t ]
