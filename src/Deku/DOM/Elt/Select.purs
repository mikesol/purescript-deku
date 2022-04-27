module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Select_

select
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Select_)
  -> seed
  -> Element lock payload
select attributes seed = elementify "select" attributes (plant seed)

select_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
select_ = select empty

