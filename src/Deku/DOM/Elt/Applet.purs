module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Applet_

applet
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Applet_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
applet attributes kids = Element' (elementify "applet" attributes (FixedChildren' (FixedChildren kids)))

applet_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
applet_ = applet empty

