module Deku.DOM.Elt.Title where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Title_

title
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Title_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
title attributes kids = Element' (elementify "title" attributes (fixed kids))

title_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
title_ = title empty

