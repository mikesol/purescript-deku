module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Style_

style
  :: forall lock payload
   . AnEvent Zora (Attribute Style_)
  -> Array (Domable lock payload)
  -> Domable lock payload
style attributes kids = Element' (elementify "style" attributes (fixed kids))

style_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
style_ = style empty

