module Deku.DOM.Elt.Button where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Button_

button
  :: forall payload
   . Event (Attribute Button_)
  -> Array (Domable payload)
  -> Domable payload
button attributes kids = Domable
  ( Element'
      ( DC.elementify "button" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

button_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
button_ = button empty

button__
  :: forall payload
   . String
  -> Domable payload
button__ t = button_ [ DC.text_ t ]
