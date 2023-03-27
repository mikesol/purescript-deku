module Deku.DOM.Elt.FeBlend where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeBlend_

feBlend
  :: forall payload
   . Event (Attribute FeBlend_)
  -> Array (Domable payload)
  -> Domable payload
feBlend attributes kids = Domable
  ( Element'
      ( DC.elementify "feBlend" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feBlend_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feBlend_ = feBlend empty

feBlend__
  :: forall payload
   . String
  -> Domable payload
feBlend__ t = feBlend_ [ DC.text_ t ]
