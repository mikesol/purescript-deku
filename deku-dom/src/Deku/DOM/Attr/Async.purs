module Deku.DOM.Attr.Async where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Script (Script_)

data Async = Async

instance Deku.Attribute.Attr everything Async Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "async", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Script_ Async String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "async", value: _ } <<< Deku.Attribute.prop'
