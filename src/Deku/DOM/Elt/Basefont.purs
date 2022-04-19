module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Basefont_

basefont
  :: forall event payload
   . IsEvent event
  => event (Attribute Basefont_)
  -> Array (Element event payload)
  -> Element event payload
basefont = elementify "basefont"

basefont_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
basefont_ = basefont empty
