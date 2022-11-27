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
  :: forall lock payload
   . Event (Attribute Set_)
  -> Array (Domable lock payload)
  -> Domable lock payload
set attributes kids = Domable
  ( Element'
      ( DC.elementify "set" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

set_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
set_ = set empty

set__
  :: forall lock payload
   . String
  -> Domable lock payload
set__ t = set_ [ DC.text_ t ]
