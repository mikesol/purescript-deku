module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Table_

table
  :: forall lock payload
   . Event (Attribute Table_)
  -> Array (Domable lock payload)
  -> Domable lock payload
table attributes kids = Element' (elementify "table" attributes (FixedChildren' (FixedChildren kids)))

table_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
table_ = table empty

