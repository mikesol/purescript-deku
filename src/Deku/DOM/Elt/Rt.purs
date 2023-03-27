module Deku.DOM.Elt.Rt where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Rt_

rt
  :: forall payload
   . Event (Attribute Rt_)
  -> Array (Domable payload)
  -> Domable payload
rt attributes kids = Domable
  ( Element'
      ( DC.elementify "rt" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rt_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
rt_ = rt empty

rt__
  :: forall payload
   . String
  -> Domable payload
rt__ t = rt_ [ DC.text_ t ]
