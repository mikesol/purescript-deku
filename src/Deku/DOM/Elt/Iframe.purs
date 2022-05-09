module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Iframe_

iframe
  :: forall lock payload
   . Event (Attribute Iframe_)
  -> Array (Domable lock payload)
  -> Domable lock payload
iframe attributes kids = Element' (elementify "iframe" attributes (FixedChildren' (FixedChildren kids)))

iframe_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
iframe_ = iframe empty

