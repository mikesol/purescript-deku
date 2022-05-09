module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data I_

i
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute I_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
i attributes kids = Element' (elementify "i" attributes (FixedChildren' (FixedChildren kids)))

i_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
i_ = i empty

