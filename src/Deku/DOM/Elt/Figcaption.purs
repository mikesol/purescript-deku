module Deku.DOM.Elt.Figcaption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Figcaption_

figcaption
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Figcaption_)
  -> seed
  -> Element lock payload
figcaption attributes seed = elementify "figcaption" attributes (plant seed)

figcaption_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
figcaption_ = figcaption empty

