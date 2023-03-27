module Deku.DOM.Elt.Area where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Area_

area
  :: forall payload
   . Event (Attribute Area_)
  -> Array (Domable payload)
  -> Domable payload
area attributes kids = Domable
  ( Element'
      ( DC.elementify "area" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

area_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
area_ = area empty

area__
  :: forall payload
   . String
  -> Domable payload
area__ t = area_ [ DC.text_ t ]
