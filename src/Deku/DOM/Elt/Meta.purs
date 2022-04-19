module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Meta_

meta
  :: forall event payload
   . IsEvent event
  => event (Attribute Meta_)
  -> Array (Element event payload)
  -> Element event payload
meta = elementify "meta"

meta_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
meta_ = meta empty
