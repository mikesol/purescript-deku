module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Pre_

pre
  :: forall lock payload
   . Event (Attribute Pre_)
  -> Array (Domable lock payload)
  -> Domable lock payload
pre attributes kids = Element' (elementify "pre" attributes (FixedChildren' (FixedChildren kids)))

pre_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
pre_ = pre empty

