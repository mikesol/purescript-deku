module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Wbr_

wbr
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Wbr_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
wbr attributes kids = Element' (elementify "wbr" attributes (FixedChildren' (FixedChildren kids)))

wbr_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
wbr_ = wbr empty

