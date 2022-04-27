module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Code_

code
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Code_)
  -> seed
  -> Element lock payload
code attributes seed = elementify "code" attributes (plant seed)

code_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
code_ = code empty

