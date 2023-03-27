module Deku.DOM.Elt.Form where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Form_

form
  :: forall payload
   . Event (Attribute Form_)
  -> Array (Domable payload)
  -> Domable payload
form attributes kids = Domable
  ( Element'
      ( DC.elementify "form" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

form_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
form_ = form empty

form__
  :: forall payload
   . String
  -> Domable payload
form__ t = form_ [ DC.text_ t ]
