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
  :: forall lock payload
   . Event (Attribute Marker_)
  -> Array (Domable lock payload)
  -> Domable lock payload
marker attributes kids = Domable
  ( Element'
      ( DC.elementify "marker" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

marker_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
marker_ = marker empty

marker__
  :: forall lock payload
   . String
  -> Domable lock payload
marker__ t = marker_ [ DC.text_ t ]
