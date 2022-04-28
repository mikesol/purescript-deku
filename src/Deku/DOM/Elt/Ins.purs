module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Ins_

ins
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Ins_)
  -> seed
  -> Element lock payload
ins attributes seed = elementify "ins" attributes (plant seed)

ins_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
ins_ = ins empty

