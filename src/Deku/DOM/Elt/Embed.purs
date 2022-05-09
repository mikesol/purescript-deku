module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Embed_

embed
  :: forall lock payload
   . Event (Attribute Embed_)
  -> Array (Domable lock payload)
  -> Domable lock payload
embed attributes kids = Element' (elementify "embed" attributes (FixedChildren' (FixedChildren kids)))

embed_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
embed_ = embed empty

