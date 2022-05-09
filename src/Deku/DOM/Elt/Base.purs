module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Base_

base
  :: forall lock payload
   . Event (Attribute Base_)
  -> Array (Domable lock payload)
  -> Domable lock payload
base attributes kids = Element' (elementify "base" attributes (FixedChildren' (FixedChildren kids)))

base_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
base_ = base empty

