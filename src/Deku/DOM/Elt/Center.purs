module Deku.DOM.Elt.Center where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Center_

center
  :: forall lock payload
   . Event (Attribute Center_)
  -> Array (Domable lock payload)
  -> Domable lock payload
center attributes kids = Domable
  ( Element'
      ( DC.elementify "center" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

center_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
center_ = center empty

center__
  :: forall lock payload
   . String
  -> Domable lock payload
center__ t = center_ [ DC.text_ t ]
