module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Template_

template
  :: forall lock payload
   . Event (Attribute Template_)
  -> Array (Domable lock payload)
  -> Domable lock payload
template attributes kids = Element' (elementify "template" attributes (FixedChildren' (FixedChildren kids)))

template_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
template_ = template empty

