module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Svg_

svg
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Svg_)
  -> seed
  -> Element lock payload
svg attributes seed = elementify "svg" attributes (plant seed)

svg_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
svg_ = svg empty

