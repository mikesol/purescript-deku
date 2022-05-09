module Deku.DOM.Elt.Figcaption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Figcaption_

figcaption
  :: forall lock payload
   . Event (Attribute Figcaption_)
  -> Array (Domable lock payload)
  -> Domable lock payload
figcaption attributes kids = Element' (elementify "figcaption" attributes (FixedChildren' (FixedChildren kids)))

figcaption_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
figcaption_ = figcaption empty

