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
  :: forall lock payload
   . Event (Attribute Rt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rt attributes kids = Domable
  ( Element'
      ( DC.elementify "rt" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rt_ = rt empty


rt__
  :: forall lock payload
   . String
  -> Domable lock payload
rt__ t = rt_ [ DC.text_ t ]
