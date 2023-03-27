module Deku.DOM.Elt.B where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data B_

b
  :: forall payload
   . Event (Attribute B_)
  -> Array (Domable payload)
  -> Domable payload
b attributes kids = Domable
  ( Element'
      ( DC.elementify "b" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

b_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
b_ = b empty

b__
  :: forall payload
   . String
  -> Domable payload
b__ t = b_ [ DC.text_ t ]
