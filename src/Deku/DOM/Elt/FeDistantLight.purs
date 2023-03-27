module Deku.DOM.Elt.FeDistantLight where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDistantLight_

feDistantLight
  :: Event (Attribute FeDistantLight_)
  -> Array Domable
  -> Domable
feDistantLight attributes kids = Domable
  ( Element'
      ( DC.elementify "feDistantLight" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDistantLight_
  :: Array Domable
  -> Domable
feDistantLight_ = feDistantLight empty

feDistantLight__
  :: String
  -> Domable
feDistantLight__ t = feDistantLight_ [ DC.text_ t ]
