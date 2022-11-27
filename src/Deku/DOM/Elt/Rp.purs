module Deku.DOM.Elt.Rp where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Rp_

rp
  :: forall lock payload
   . Event (Attribute Rp_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rp attributes kids = Domable
  ( Element'
      ( DC.elementify "rp" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rp_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rp_ = rp empty

rp__
  :: forall lock payload
   . String
  -> Domable lock payload
rp__ t = rp_ [ DC.text_ t ]
