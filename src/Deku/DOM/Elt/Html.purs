module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Html_

html
  :: forall lock payload
   . AnEvent Zora (Attribute Html_)
  -> Array (Domable lock payload)
  -> Domable lock payload
html attributes kids = Element' (elementify "html" attributes (fixed kids))

html_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
html_ = html empty

