module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Picture_

picture
  :: forall lock payload
   . Event (Attribute Picture_)
  -> Array (Domable lock payload)
  -> Domable lock payload
picture attributes kids = Element' (elementify "picture" attributes (FixedChildren' (FixedChildren kids)))

picture_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
picture_ = picture empty

