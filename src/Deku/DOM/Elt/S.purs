module Deku.DOM.Elt.S where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data S_

s
  :: forall payload
   . Event (Attribute S_)
  -> Array (Domable payload)
  -> Domable payload
s attributes kids = Domable
  ( Element'
      ( DC.elementify "s" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

s_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
s_ = s empty

s__
  :: forall payload
   . String
  -> Domable payload
s__ t = s_ [ DC.text_ t ]
