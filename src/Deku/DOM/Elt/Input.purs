module Deku.DOM.Elt.Input where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Input_

input
  :: forall payload
   . Event (Attribute Input_)
  -> Array (Domable payload)
  -> Domable payload
input attributes kids = Domable
  ( Element'
      ( DC.elementify "input" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

input_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
input_ = input empty

input__
  :: forall payload
   . String
  -> Domable payload
input__ t = input_ [ DC.text_ t ]
