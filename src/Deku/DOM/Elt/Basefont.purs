module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Basefont_

basefont
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Basefont_)
  -> seed
  -> Element lock payload
basefont attributes seed = elementify "basefont" attributes (plant seed)

basefont_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
basefont_ = basefont empty

