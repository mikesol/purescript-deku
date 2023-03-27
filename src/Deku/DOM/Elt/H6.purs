module Deku.DOM.Elt.H6 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H6_

h6
  :: forall payload
   . Event (Attribute H6_)
  -> Array (Domable payload)
  -> Domable payload
h6 attributes kids = Domable
  ( Element'
      ( DC.elementify "h6" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h6_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
h6_ = h6 empty

h6__
  :: forall payload
   . String
  -> Domable payload
h6__ t = h6_ [ DC.text_ t ]
