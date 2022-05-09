module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Script_

script
  :: forall lock payload
   . Event (Attribute Script_)
  -> Array (Domable lock payload)
  -> Domable lock payload
script attributes kids = Element' (elementify "script" attributes (FixedChildren' (FixedChildren kids)))

script_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
script_ = script empty

