module Deku.DOM.Elt.Param where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Param_

param
  :: Event (Attribute Param_)
  -> Array Domable
  -> Domable
param attributes kids = Domable
  ( Element'
      ( DC.elementify "param" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

param_
  :: Array Domable
  -> Domable
param_ = param empty

param__
  :: String
  -> Domable
param__ t = param_ [ DC.text_ t ]
