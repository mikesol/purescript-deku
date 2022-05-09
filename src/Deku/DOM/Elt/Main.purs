module Deku.DOM.Elt.Main where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Main_

main
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Main_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
main attributes kids = Element' (elementify "main" attributes (FixedChildren' (FixedChildren kids)))

main_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
main_ = main empty

