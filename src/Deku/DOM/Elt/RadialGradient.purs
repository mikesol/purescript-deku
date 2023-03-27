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
  :: forall payload
   . Event (Attribute RadialGradient_)
  -> Array (Domable payload)
  -> Domable payload
radialGradient attributes kids = Domable
  ( Element'
      ( DC.elementify "radialGradient" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

radialGradient_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
radialGradient_ = radialGradient empty

radialGradient__
  :: forall payload
   . String
  -> Domable payload
radialGradient__ t = radialGradient_ [ DC.text_ t ]
