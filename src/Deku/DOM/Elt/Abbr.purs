module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Abbr_

abbr
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Abbr_)
  -> seed
  -> Element lock payload
abbr attributes seed = elementify "abbr" attributes (plant seed)

abbr_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
abbr_ = abbr empty

