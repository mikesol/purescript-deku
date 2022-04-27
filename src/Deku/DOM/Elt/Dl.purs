module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Dl_

dl
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Dl_)
  -> seed
  -> Element lock payload
dl attributes seed = elementify "dl" attributes (plant seed)

dl_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
dl_ = dl empty

