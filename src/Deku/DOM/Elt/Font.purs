module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Font_

font
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Font_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
font attributes kids = Element' (elementify "font" attributes (fixed kids))

font_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
font_ = font empty

