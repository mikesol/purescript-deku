module Deku.DOM.Attr.Link where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Body (Body_)

data Link = Link

instance Deku.Attribute.Attr everything Link Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "link", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Link String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "link", value: _ } <<< Deku.Attribute.prop'
