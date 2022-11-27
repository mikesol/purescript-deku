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
  :: forall lock payload
   . Event (Attribute Strike_)
  -> Array (Domable lock payload)
  -> Domable lock payload
strike attributes kids = Domable
  ( Element'
      ( DC.elementify "strike" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

strike_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
strike_ = strike empty

strike__
  :: forall lock payload
   . String
  -> Domable lock payload
strike__ t = strike_ [ DC.text_ t ]
