module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Blockquote_

blockquote
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Blockquote_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
blockquote attributes kids = Element' (elementify "blockquote" attributes (fixed kids))

blockquote_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
blockquote_ = blockquote empty

