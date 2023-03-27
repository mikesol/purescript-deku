module Deku.DOM.Elt.FePointLight where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FePointLight_

fePointLight
  :: forall payload
   . Event (Attribute FePointLight_)
  -> Array (Domable payload)
  -> Domable payload
fePointLight attributes kids = Domable
  ( Element'
      ( DC.elementify "fePointLight" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

fePointLight_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
fePointLight_ = fePointLight empty

fePointLight__
  :: forall payload
   . String
  -> Domable payload
fePointLight__ t = fePointLight_ [ DC.text_ t ]
