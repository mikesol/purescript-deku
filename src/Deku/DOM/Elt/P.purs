module Deku.DOM.Elt.P where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data P_

p
  :: forall payload
   . Event (Attribute P_)
  -> Array (Domable payload)
  -> Domable payload
p attributes kids = Domable
  ( Element'
      ( DC.elementify "p" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

p_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
p_ = p empty

p__
  :: forall payload
   . String
  -> Domable payload
p__ t = p_ [ DC.text_ t ]
