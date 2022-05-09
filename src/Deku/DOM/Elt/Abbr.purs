module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Abbr_

abbr
  :: forall lock payload
   . Event (Attribute Abbr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
abbr attributes kids = Element' (elementify "abbr" attributes (FixedChildren' (FixedChildren kids)))

abbr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
abbr_ = abbr empty

