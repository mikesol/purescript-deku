module Deku.DOM.Elt.Stop where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Stop_

stop
  :: forall payload
   . Event (Attribute Stop_)
  -> Array (Domable payload)
  -> Domable payload
stop attributes kids = Domable
  ( Element'
      ( DC.elementify "stop" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

stop_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
stop_ = stop empty

stop__
  :: forall payload
   . String
  -> Domable payload
stop__ t = stop_ [ DC.text_ t ]
