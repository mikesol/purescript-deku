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
  :: Event (Attribute FeSpecularLighting_)
  -> Array Domable
  -> Domable
feSpecularLighting attributes kids = Domable
  ( Element'
      ( DC.elementify "feSpecularLighting" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feSpecularLighting_
  :: Array Domable
  -> Domable
feSpecularLighting_ = feSpecularLighting empty

feSpecularLighting__
  :: String
  -> Domable
feSpecularLighting__ t = feSpecularLighting_ [ DC.text_ t ]
