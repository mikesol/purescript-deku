module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Html_

html
  :: forall lock payload
   . Event (Attribute Html_)
  -> Array (Domable lock payload)
  -> Domable lock payload
html attributes kids = Element' (elementify "html" attributes (FixedChildren' (FixedChildren kids)))

html_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
html_ = html empty

