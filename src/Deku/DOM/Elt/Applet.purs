module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Applet_

applet
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Applet_)
  -> seed
  -> Element lock payload
applet attributes seed = elementify "applet" attributes (plant seed)

applet_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
applet_ = applet empty

