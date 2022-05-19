module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Blockquote_

blockquote
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Blockquote_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
blockquote attributes kids = Element' (elementify "blockquote" attributes (fixed kids))

blockquote_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
blockquote_ = blockquote empty

