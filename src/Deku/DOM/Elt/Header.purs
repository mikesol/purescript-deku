module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Header_

header
  :: forall lock payload
   . Event (Attribute Header_)
  -> Array (Domable lock payload)
  -> Domable lock payload
header attributes kids = Element' (elementify "header" attributes (FixedChildren' (FixedChildren kids)))

header_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
header_ = header empty

