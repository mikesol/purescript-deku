module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Embed_

embed
  :: forall event payload
   . IsEvent event
  => event (Attribute Embed_)
  -> Array (Element event payload)
  -> Element event payload
embed = elementify "embed"

embed_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
embed_ = embed empty
