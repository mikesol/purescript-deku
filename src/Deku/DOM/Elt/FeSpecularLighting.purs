module Deku.DOM.Elt.FeSpecularLighting where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeSpecularLighting_

feSpecularLighting
  :: forall payload
   . Event (Attribute FeSpecularLighting_)
  -> Array (Domable payload)
  -> Domable payload
feSpecularLighting attributes kids = Domable
  ( Element'
      ( DC.elementify "feSpecularLighting" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feSpecularLighting_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feSpecularLighting_ = feSpecularLighting empty

feSpecularLighting__
  :: forall payload
   . String
  -> Domable payload
feSpecularLighting__ t = feSpecularLighting_ [ DC.text_ t ]
