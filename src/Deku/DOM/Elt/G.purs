module Deku.DOM.Elt.G where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data G_

g
  :: forall payload
   . Event (Attribute G_)
  -> Array (Domable payload)
  -> Domable payload
g attributes kids = Domable
  ( Element'
      ( DC.elementify "g" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

g_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
g_ = g empty

g__
  :: forall payload
   . String
  -> Domable payload
g__ t = g_ [ DC.text_ t ]
