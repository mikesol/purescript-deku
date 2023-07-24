module Deku.DOM.Attr.Declare where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Object (Object_)

data Declare = Declare

instance Deku.Attribute.Attr everything Declare Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "declare", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Declare String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "declare", value: _ } <<< Deku.Attribute.prop'
