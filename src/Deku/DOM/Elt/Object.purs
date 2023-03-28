module Deku.DOM.Elt.Object where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Object_

object
  :: Event (Attribute Object_)
  -> Array Domable
  -> Domable
object = DC.elementify2 "object"

object_
  :: Array Domable
  -> Domable
object_ = object empty

object__
  :: String
  -> Domable
object__ t = object_ [ DC.text_ t ]
