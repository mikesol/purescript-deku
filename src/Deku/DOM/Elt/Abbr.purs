module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Abbr_

abbr
  :: forall event payload
   . IsEvent event
  => event (Attribute Abbr_)
  -> Array (Element event payload)
  -> Element event payload
abbr = elementify "abbr"

abbr_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
abbr_ = abbr empty
