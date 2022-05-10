module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Section_

section
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Section_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
section attributes kids = Element'
  (elementify "section" attributes (FixedChildren' (FixedChildren kids)))

section_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
section_ = section empty

