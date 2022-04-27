module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Frameset_

frameset
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Frameset_)
  -> seed
  -> Element lock payload
frameset attributes seed = elementify "frameset" attributes (plant seed)

frameset_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
frameset_ = frameset empty

