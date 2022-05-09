module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Dfn_

dfn
  :: forall lock payload
   . Event (Attribute Dfn_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dfn attributes kids = Element' (elementify "dfn" attributes (FixedChildren' (FixedChildren kids)))

dfn_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dfn_ = dfn empty

