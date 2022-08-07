module Deku.DOM.Elt.Select where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Select_

select
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Select_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
select attributes kids = Element' (elementify "select" attributes (fixed kids))

select_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
select_ = select empty

