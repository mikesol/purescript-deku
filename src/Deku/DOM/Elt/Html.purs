module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Html_

html
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Html_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
html attributes kids = Element' (elementify "html" attributes (fixed kids))

html_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
html_ = html empty

