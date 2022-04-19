module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Dfn_

dfn
  :: forall event payload
   . IsEvent event
  => event (Attribute Dfn_)
  -> Array (Element event payload)
  -> Element event payload
dfn = elementify "dfn"

dfn_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
dfn_ = dfn empty
