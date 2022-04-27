module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Ol_

ol
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Ol_)
  -> seed
  -> Element lock payload
ol attributes seed = elementify "ol" attributes (plant seed)

ol_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
ol_ = ol empty

