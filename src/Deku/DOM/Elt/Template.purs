module Deku.DOM.Elt.Template where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Template_

template
  :: forall payload
   . Event (Attribute Template_)
  -> Array (Domable payload)
  -> Domable payload
template attributes kids = Domable
  ( Element'
      ( DC.elementify "template" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

template_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
template_ = template empty

template__
  :: forall payload
   . String
  -> Domable payload
template__ t = template_ [ DC.text_ t ]
