module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Datalist_

datalist
  :: forall lock payload
   . Event (Attribute Datalist_)
  -> Array (Domable lock payload)
  -> Domable lock payload
datalist attributes kids = Element' (elementify "datalist" attributes (FixedChildren' (FixedChildren kids)))

datalist_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
datalist_ = datalist empty

