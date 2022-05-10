module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Script_

script
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Script_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
script attributes kids = Element'
  (elementify "script" attributes (FixedChildren' (FixedChildren kids)))

script_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
script_ = script empty

