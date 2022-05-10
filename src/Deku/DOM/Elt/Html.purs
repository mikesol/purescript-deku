module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Html_

html
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Html_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
html attributes kids = Element'
  (elementify "html" attributes (FixedChildren' (FixedChildren kids)))

html_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
html_ = html empty

