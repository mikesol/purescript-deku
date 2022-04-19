module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Svg_

svg
  :: forall event payload
   . IsEvent event
  => event (Attribute Svg_)
  -> Array (Element event payload)
  -> Element event payload
svg = elementify "svg"

svg_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
svg_ = svg empty
