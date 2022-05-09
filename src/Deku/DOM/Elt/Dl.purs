module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Dl_

dl
  :: forall lock payload
   . Event (Attribute Dl_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dl attributes kids = Element' (elementify "dl" attributes (FixedChildren' (FixedChildren kids)))

dl_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dl_ = dl empty

