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
  :: forall lock payload
   . Event (Attribute Template_)
  -> Array (Domable lock payload)
  -> Domable lock payload
template attributes kids = Domable
  ( Element'
      ( DC.elementify "template" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

template_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
template_ = template empty


template__
  :: forall lock payload
   . String
  -> Domable lock payload
template__ t = template_ [ DC.text_ t ]
