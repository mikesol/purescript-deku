module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Var_

var
  :: forall lock payload
   . AnEvent M (Attribute Var_)
  -> Array (Domable lock payload)
  -> Domable lock payload
var attributes kids = Element' (elementify "var" attributes (fixed kids))

var_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
var_ = var empty

