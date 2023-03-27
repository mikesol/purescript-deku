module Deku.DOM.Elt.A where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data A_

a
  :: forall payload
   . Event (Attribute A_)
  -> Array (Domable payload)
  -> Domable payload
a attributes kids = Domable
  ( Element'
      ( DC.elementify "a" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

a_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
a_ = a empty

a__
  :: forall payload
   . String
  -> Domable payload
a__ t = a_ [ DC.text_ t ]
