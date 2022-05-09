module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Kbd_

kbd
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Kbd_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
kbd attributes kids = Element' (elementify "kbd" attributes (FixedChildren' (FixedChildren kids)))

kbd_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
kbd_ = kbd empty

