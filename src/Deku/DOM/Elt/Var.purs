module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element)
import FRP.Event (Event)

data Var_

var
  :: forall seed lock payload
   . Plant seed (Event (Event (Child lock payload)))
  => Event (Attribute Var_)
  -> seed
  -> Element lock payload
var attributes seed = elementify "var" attributes (plant seed)

var_
  :: forall seed lock payload
   . Plant seed (Event (Event (Child lock payload)))
  => seed
  -> Element lock payload
var_ = var empty

