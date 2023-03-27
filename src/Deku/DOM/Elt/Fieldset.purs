module Deku.DOM.Elt.Fieldset where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Fieldset_

fieldset
  :: forall payload
   . Event (Attribute Fieldset_)
  -> Array (Domable payload)
  -> Domable payload
fieldset attributes kids = Domable
  ( Element'
      ( DC.elementify "fieldset" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

fieldset_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
fieldset_ = fieldset empty

fieldset__
  :: forall payload
   . String
  -> Domable payload
fieldset__ t = fieldset_ [ DC.text_ t ]
