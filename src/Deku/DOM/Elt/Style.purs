module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Style_

style
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Style_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
style attributes kids = Element' (elementify "style" attributes (fixed kids))

style_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
style_ = style empty

