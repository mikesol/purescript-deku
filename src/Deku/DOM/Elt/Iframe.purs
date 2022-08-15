module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Iframe_

iframe
  :: forall lock payload
   . AnEvent Zora (Attribute Iframe_)
  -> Array (Domable lock payload)
  -> Domable lock payload
iframe attributes kids = Element' (elementify "iframe" attributes (fixed kids))

iframe_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
iframe_ = iframe empty

