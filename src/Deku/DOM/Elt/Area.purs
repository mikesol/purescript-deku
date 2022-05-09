module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Area_

area
  :: forall lock payload
   . Event (Attribute Area_)
  -> Array (Domable lock payload)
  -> Domable lock payload
area attributes kids = Element' (elementify "area" attributes (FixedChildren' (FixedChildren kids)))

area_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
area_ = area empty

