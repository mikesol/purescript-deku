module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Textarea_

textarea
  :: forall lock payload
   . Event (Attribute Textarea_)
  -> Array (Domable lock payload)
  -> Domable lock payload
textarea attributes kids = Element' (elementify "textarea" attributes (FixedChildren' (FixedChildren kids)))

textarea_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
textarea_ = textarea empty

