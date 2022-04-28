module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Html_

html
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Html_)
  -> seed
  -> Element lock payload
html attributes seed = elementify "html" attributes (plant seed)

html_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
html_ = html empty

