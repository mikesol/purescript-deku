module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Nav_

nav
  :: forall event payload
   . IsEvent event
  => event (Attribute Nav_)
  -> Array (Element event payload)
  -> Element event payload
nav = elementify "nav"

nav_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
nav_ = nav empty
