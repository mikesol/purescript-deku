module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Nav_

nav
  :: forall lock payload
   . Event (Attribute Nav_)
  -> Array (Domable lock payload)
  -> Domable lock payload
nav attributes kids = Element' (elementify "nav" attributes (fixed kids))

nav_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
nav_ = nav empty

