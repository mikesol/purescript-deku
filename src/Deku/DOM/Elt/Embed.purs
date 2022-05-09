module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Embed_

embed
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Embed_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
embed attributes kids = Element' (elementify "embed" attributes (FixedChildren' (FixedChildren kids)))

embed_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
embed_ = embed empty

