module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Div_

div
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Div_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
div attributes kids = Element' (elementify "div" attributes (FixedChildren' (FixedChildren kids)))

div_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
div_ = div empty

