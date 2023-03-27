module Deku.DOM.Elt.FeSpotLight where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeSpotLight_

feSpotLight
  :: forall payload
   . Event (Attribute FeSpotLight_)
  -> Array (Domable payload)
  -> Domable payload
feSpotLight attributes kids = Domable
  ( Element'
      ( DC.elementify "feSpotLight" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feSpotLight_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feSpotLight_ = feSpotLight empty

feSpotLight__
  :: forall payload
   . String
  -> Domable payload
feSpotLight__ t = feSpotLight_ [ DC.text_ t ]
