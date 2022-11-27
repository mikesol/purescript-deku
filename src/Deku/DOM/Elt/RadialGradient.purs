module Deku.DOM.Elt.RadialGradient where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data RadialGradient_

radialGradient
  :: forall lock payload
   . Event (Attribute RadialGradient_)
  -> Array (Domable lock payload)
  -> Domable lock payload
radialGradient attributes kids = Domable
  ( Element'
      ( DC.elementify "radialGradient" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

radialGradient_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
radialGradient_ = radialGradient empty

radialGradient__
  :: forall lock payload
   . String
  -> Domable lock payload
radialGradient__ t = radialGradient_ [ DC.text_ t ]
