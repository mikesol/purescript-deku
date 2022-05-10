module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Title_

title
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Title_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
title attributes kids = Element'
  (elementify "title" attributes (FixedChildren' (FixedChildren kids)))

title_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
title_ = title empty

