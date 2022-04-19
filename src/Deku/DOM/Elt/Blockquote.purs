module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Blockquote_

blockquote
  :: forall event payload
   . IsEvent event
  => event (Attribute Blockquote_)
  -> Array (Element event payload)
  -> Element event payload
blockquote = elementify "blockquote"

blockquote_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
blockquote_ = blockquote empty
