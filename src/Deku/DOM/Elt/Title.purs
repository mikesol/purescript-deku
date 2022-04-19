module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Title_

title
  :: forall event payload
   . IsEvent event
  => event (Attribute Title_)
  -> Array (Element event payload)
  -> Element event payload
title = elementify "title"

title_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
title_ = title empty
