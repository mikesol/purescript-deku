module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Article_

article
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Article_)
  -> seed
  -> Element lock payload
article attributes seed = elementify "article" attributes (plant seed)

article_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
article_ = article empty

