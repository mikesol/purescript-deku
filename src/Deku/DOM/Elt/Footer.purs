module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Footer_

footer
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Footer_)
  -> seed
  -> Element lock payload
footer attributes seed = elementify "footer" attributes (plant seed)

footer_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
footer_ = footer empty

