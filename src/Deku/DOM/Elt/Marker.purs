module Deku.DOM.Elt.Marker where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Marker_

marker
  :: forall payload
   . Event (Attribute Marker_)
  -> Array (Domable payload)
  -> Domable payload
marker attributes kids = Domable
  ( Element'
      ( DC.elementify "marker" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

marker_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
marker_ = marker empty

marker__
  :: forall payload
   . String
  -> Domable payload
marker__ t = marker_ [ DC.text_ t ]
