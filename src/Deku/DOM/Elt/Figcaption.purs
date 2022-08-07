module Deku.DOM.Elt.Figcaption where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Figcaption_

figcaption
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Figcaption_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
figcaption attributes kids = Element' (elementify "figcaption" attributes (fixed kids))

figcaption_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
figcaption_ = figcaption empty

