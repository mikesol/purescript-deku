module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Article_

article
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Article_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
article attributes kids = Element' (elementify "article" attributes (fixed kids))

article_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
article_ = article empty

