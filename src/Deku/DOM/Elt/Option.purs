module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Option_

option
  :: forall lock payload
   . Event (Attribute Option_)
  -> Array (Domable lock payload)
  -> Domable lock payload
option attributes kids = Element' (elementify "option" attributes (FixedChildren' (FixedChildren kids)))

option_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
option_ = option empty

