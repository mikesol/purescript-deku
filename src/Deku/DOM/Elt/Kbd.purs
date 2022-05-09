module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Kbd_

kbd
  :: forall lock payload
   . Event (Attribute Kbd_)
  -> Array (Domable lock payload)
  -> Domable lock payload
kbd attributes kids = Element' (elementify "kbd" attributes (FixedChildren' (FixedChildren kids)))

kbd_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
kbd_ = kbd empty

