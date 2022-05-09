module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Blockquote_

blockquote
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Blockquote_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
blockquote attributes kids = Element' (elementify "blockquote" attributes (FixedChildren' (FixedChildren kids)))

blockquote_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
blockquote_ = blockquote empty

