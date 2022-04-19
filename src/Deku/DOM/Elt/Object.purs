module Deku.DOM.Elt.Object where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Object_

object
  :: forall event payload
   . IsEvent event
  => event (Attribute Object_)
  -> Array (Element event payload)
  -> Element event payload
object = elementify "object"

object_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
object_ = object empty
