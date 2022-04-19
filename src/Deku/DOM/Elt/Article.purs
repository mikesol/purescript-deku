module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Article_

article
  :: forall event payload
   . IsEvent event
  => event (Attribute Article_)
  -> Array (Element event payload)
  -> Element event payload
article = elementify "article"

article_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
article_ = article empty
