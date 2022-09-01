module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Section_

section
  :: forall lock payload
   . Event (Attribute Section_)
  -> Array (Domable lock payload)
  -> Domable lock payload
section attributes kids = Element' (elementify "section" attributes (fixed kids))

section_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
section_ = section empty

