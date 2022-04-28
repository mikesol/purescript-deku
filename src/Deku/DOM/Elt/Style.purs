module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Style_

style
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Style_)
  -> seed
  -> Element lock payload
style attributes seed = elementify "style" attributes (plant seed)

style_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
style_ = style empty

