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
  :: forall lock payload
   . Event (Attribute Form_)
  -> Array (Domable lock payload)
  -> Domable lock payload
form attributes kids = Domable
  ( Element'
      ( DC.elementify "form" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

form_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
form_ = form empty


form__
  :: forall lock payload
   . String
  -> Domable lock payload
form__ t = form_ [ DC.text_ t ]
