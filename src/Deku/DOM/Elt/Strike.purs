module Deku.DOM.Elt.Strike where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Strike_

strike
  :: forall payload
   . Event (Attribute Strike_)
  -> Array (Domable payload)
  -> Domable payload
strike attributes kids = Domable
  ( Element'
      ( DC.elementify "strike" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

strike_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
strike_ = strike empty

strike__
  :: forall payload
   . String
  -> Domable payload
strike__ t = strike_ [ DC.text_ t ]
