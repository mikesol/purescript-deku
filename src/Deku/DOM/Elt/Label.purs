module Deku.DOM.Elt.Label where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Label_

label
  :: forall payload
   . Event (Attribute Label_)
  -> Array (Domable payload)
  -> Domable payload
label attributes kids = Domable
  ( Element'
      ( DC.elementify "label" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

label_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
label_ = label empty

label__
  :: forall payload
   . String
  -> Domable payload
label__ t = label_ [ DC.text_ t ]
