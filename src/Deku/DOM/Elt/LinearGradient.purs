module Deku.DOM.Elt.LinearGradient where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data LinearGradient_

linearGradient
  :: forall payload
   . Event (Attribute LinearGradient_)
  -> Array (Domable payload)
  -> Domable payload
linearGradient attributes kids = Domable
  ( Element'
      ( DC.elementify "linearGradient" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

linearGradient_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
linearGradient_ = linearGradient empty

linearGradient__
  :: forall payload
   . String
  -> Domable payload
linearGradient__ t = linearGradient_ [ DC.text_ t ]
