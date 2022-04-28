module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Wbr_

wbr
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Wbr_)
  -> seed
  -> Element lock payload
wbr attributes seed = elementify "wbr" attributes (plant seed)

wbr_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
wbr_ = wbr empty

