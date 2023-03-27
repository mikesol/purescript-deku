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
  :: forall payload
   . Event (Attribute Param_)
  -> Array (Domable payload)
  -> Domable payload
param attributes kids = Domable
  ( Element'
      ( DC.elementify "param" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

param_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
param_ = param empty

param__
  :: forall payload
   . String
  -> Domable payload
param__ t = param_ [ DC.text_ t ]
