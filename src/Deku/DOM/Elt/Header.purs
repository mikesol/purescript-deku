module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Header_

header
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Header_)
  -> seed
  -> Element lock payload
header attributes seed = elementify "header" attributes (plant seed)

header_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
header_ = header empty

