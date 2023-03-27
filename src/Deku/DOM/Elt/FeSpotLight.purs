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
  :: Event (Attribute FeSpotLight_)
  -> Array Domable
  -> Domable
feSpotLight attributes kids = Domable
  ( Element'
      ( DC.elementify "feSpotLight" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feSpotLight_
  :: Array Domable
  -> Domable
feSpotLight_ = feSpotLight empty

feSpotLight__
  :: String
  -> Domable
feSpotLight__ t = feSpotLight_ [ DC.text_ t ]
