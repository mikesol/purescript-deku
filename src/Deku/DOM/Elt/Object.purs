module Deku.DOM.Elt.Object where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

object
  :: Array (Event (Attribute Tags.Object_))
  -> Array Nut
  -> Nut
object = DC.elementify3 "object"

object_
  :: Array Nut
  -> Nut
object_ = object empty

object__
  :: String
  -> Nut
object__ t = object_ [ DC.text_ t ]
