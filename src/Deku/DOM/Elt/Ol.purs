module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Ol_

ol
  :: forall lock payload
   . Event (Attribute Ol_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ol attributes kids = Element' (elementify "ol" attributes (FixedChildren' (FixedChildren kids)))

ol_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ol_ = ol empty

