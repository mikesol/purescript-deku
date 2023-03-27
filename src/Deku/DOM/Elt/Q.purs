module Deku.DOM.Elt.Q where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Q_

q
  :: forall payload
   . Event (Attribute Q_)
  -> Array (Domable payload)
  -> Domable payload
q attributes kids = Domable
  ( Element'
      ( DC.elementify "q" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

q_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
q_ = q empty

q__
  :: forall payload
   . String
  -> Domable payload
q__ t = q_ [ DC.text_ t ]
