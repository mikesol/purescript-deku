module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Bdo_

bdo
  :: forall lock payload
   . Event (Attribute Bdo_)
  -> Array (Domable lock payload)
  -> Domable lock payload
bdo attributes kids = Element' (elementify "bdo" attributes (FixedChildren' (FixedChildren kids)))

bdo_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
bdo_ = bdo empty

