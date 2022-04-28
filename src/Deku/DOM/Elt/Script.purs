module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Script_

script
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Script_)
  -> seed
  -> Element lock payload
script attributes seed = elementify "script" attributes (plant seed)

script_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
script_ = script empty

