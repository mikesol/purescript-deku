module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Big_

big
  :: forall event payload
   . IsEvent event
  => event (Attribute Big_)
  -> Array (Element event payload)
  -> Element event payload
big = elementify "big"

big_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
big_ = big empty
