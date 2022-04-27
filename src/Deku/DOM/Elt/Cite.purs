module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Cite_

cite
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Cite_)
  -> seed
  -> Element lock payload
cite attributes seed = elementify "cite" attributes (plant seed)

cite_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
cite_ = cite empty

