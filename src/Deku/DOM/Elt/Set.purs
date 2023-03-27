module Deku.DOM.Elt.Set where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Set_

set
  :: forall payload
   . Event (Attribute Set_)
  -> Array (Domable payload)
  -> Domable payload
set attributes kids = Domable
  ( Element'
      ( DC.elementify "set" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

set_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
set_ = set empty

set__
  :: forall payload
   . String
  -> Domable payload
set__ t = set_ [ DC.text_ t ]
