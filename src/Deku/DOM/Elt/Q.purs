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
  :: forall lock payload
   . Event (Attribute Q_)
  -> Array (Domable lock payload)
  -> Domable lock payload
q attributes kids = Domable
  ( Element'
      ( DC.elementify "q" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

q_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
q_ = q empty

q__
  :: forall lock payload
   . String
  -> Domable lock payload
q__ t = q_ [ DC.text_ t ]
