module Deku.DOM.Elt.H1 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H1_

h1
  :: forall payload
   . Event (Attribute H1_)
  -> Array (Domable payload)
  -> Domable payload
h1 attributes kids = Domable
  ( Element'
      ( DC.elementify "h1" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h1_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
h1_ = h1 empty

h1__
  :: forall payload
   . String
  -> Domable payload
h1__ t = h1_ [ DC.text_ t ]
