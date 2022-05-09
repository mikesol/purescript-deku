module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Frameset_

frameset
  :: forall lock payload
   . Event (Attribute Frameset_)
  -> Array (Domable lock payload)
  -> Domable lock payload
frameset attributes kids = Element' (elementify "frameset" attributes (FixedChildren' (FixedChildren kids)))

frameset_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
frameset_ = frameset empty

