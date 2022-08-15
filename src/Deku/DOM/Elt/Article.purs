module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Article_

article
  :: forall lock payload
   . AnEvent Zora (Attribute Article_)
  -> Array (Domable lock payload)
  -> Domable lock payload
article attributes kids = Element'
  (elementify "article" attributes (fixed kids))

article_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
article_ = article empty

