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
  :: Event (Attribute FePointLight_)
  -> Array Domable
  -> Domable
fePointLight attributes kids = Domable
  ( Element'
      ( DC.elementify "fePointLight" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

fePointLight_
  :: Array Domable
  -> Domable
fePointLight_ = fePointLight empty

fePointLight__
  :: String
  -> Domable
fePointLight__ t = fePointLight_ [ DC.text_ t ]
