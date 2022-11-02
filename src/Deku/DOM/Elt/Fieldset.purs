module Deku.DOM.Elt.Fieldset where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Fieldset_

fieldset
  :: forall lock payload
   . Event (Attribute Fieldset_)
  -> Array (Domable lock payload)
  -> Domable lock payload
fieldset attributes kids = Domable
  ( Element'
      ( elementify "fieldset" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

fieldset_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
fieldset_ = fieldset empty

