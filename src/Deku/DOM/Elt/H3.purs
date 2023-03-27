module Deku.DOM.Elt.H3 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H3_

h3
  :: forall payload
   . Event (Attribute H3_)
  -> Array (Domable payload)
  -> Domable payload
h3 attributes kids = Domable
  ( Element'
      ( DC.elementify "h3" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h3_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
h3_ = h3 empty

h3__
  :: forall payload
   . String
  -> Domable payload
h3__ t = h3_ [ DC.text_ t ]
