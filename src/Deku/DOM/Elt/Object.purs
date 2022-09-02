module Deku.DOM.Elt.Object where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Object_

object
  :: forall lock payload
   . Event (Attribute Object_)
  -> Array (Domable lock payload)
  -> Domable lock payload
object attributes kids = Element' (elementify "object" attributes (fixed kids))

object_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
object_ = object empty

