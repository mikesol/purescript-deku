module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Html_

html
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Html_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
html attributes kids = Element' (elementify "html" attributes (fixed kids))

html_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
html_ = html empty

