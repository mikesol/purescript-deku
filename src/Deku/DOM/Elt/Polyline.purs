module Deku.DOM.Elt.Polyline where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Polyline_

polyline
  :: forall payload
   . Event (Attribute Polyline_)
  -> Array (Domable payload)
  -> Domable payload
polyline attributes kids = Domable
  ( Element'
      ( DC.elementify "polyline" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

polyline_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
polyline_ = polyline empty

polyline__
  :: forall payload
   . String
  -> Domable payload
polyline__ t = polyline_ [ DC.text_ t ]
