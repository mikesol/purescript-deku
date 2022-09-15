module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Var_

var
  :: forall lock payload
   . Event (Attribute Var_)
  -> Array (Domable lock payload)
  -> Domable lock payload
var attributes kids = Domable (Element' (elementify "var" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

var_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
var_ = var empty

