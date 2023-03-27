module Deku.DOM.Elt.FeOffset where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeOffset_

feOffset
  :: forall payload
   . Event (Attribute FeOffset_)
  -> Array (Domable payload)
  -> Domable payload
feOffset attributes kids = Domable
  ( Element'
      ( DC.elementify "feOffset" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feOffset_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feOffset_ = feOffset empty

feOffset__
  :: forall payload
   . String
  -> Domable payload
feOffset__ t = feOffset_ [ DC.text_ t ]
