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
  :: forall payload
   . Event (Attribute FeDistantLight_)
  -> Array (Domable payload)
  -> Domable payload
feDistantLight attributes kids = Domable
  ( Element'
      ( DC.elementify "feDistantLight" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDistantLight_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feDistantLight_ = feDistantLight empty

feDistantLight__
  :: forall payload
   . String
  -> Domable payload
feDistantLight__ t = feDistantLight_ [ DC.text_ t ]
