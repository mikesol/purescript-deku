module Deku.DOM.Elt.FeSpecularLighting where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeSpecularLighting_

feSpecularLighting
  :: forall lock payload
   . Event (Attribute FeSpecularLighting_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feSpecularLighting attributes kids = Domable
  ( Element'
      ( elementify "feSpecularLighting" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feSpecularLighting_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feSpecularLighting_ = feSpecularLighting empty