module Deku.DOM.Elt.FeSpotLight where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeSpotLight_

feSpotLight
  :: forall lock payload
   . Event (Attribute FeSpotLight_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feSpotLight attributes kids = Domable
  ( Element'
      ( elementify "feSpotLight" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feSpotLight_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feSpotLight_ = feSpotLight empty
