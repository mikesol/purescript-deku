module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Thead_

thead
  :: forall lock payload
   . Event (Attribute Thead_)
  -> Array (Domable lock payload)
  -> Domable lock payload
thead attributes kids = Element' (elementify "thead" attributes (FixedChildren' (FixedChildren kids)))

thead_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
thead_ = thead empty

