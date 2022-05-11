module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Article_

article
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Article_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
article attributes kids = Element' (elementify "article" attributes (fixed kids))

article_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
article_ = article empty

