module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Iframe_

iframe
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Iframe_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
iframe attributes kids = Element'
  (elementify "iframe" attributes (FixedChildren' (FixedChildren kids)))

iframe_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
iframe_ = iframe empty

