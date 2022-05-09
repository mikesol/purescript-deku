module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Noframes_

noframes
  :: forall lock payload
   . Event (Attribute Noframes_)
  -> Array (Domable lock payload)
  -> Domable lock payload
noframes attributes kids = Element' (elementify "noframes" attributes (FixedChildren' (FixedChildren kids)))

noframes_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
noframes_ = noframes empty

