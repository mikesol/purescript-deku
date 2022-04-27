module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Dfn_

dfn
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Dfn_)
  -> seed
  -> Element lock payload
dfn attributes seed = elementify "dfn" attributes (plant seed)

dfn_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
dfn_ = dfn empty

