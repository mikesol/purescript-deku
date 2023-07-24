module Deku.DOM.Attr.Text where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Body (Body_)

data Text = Text

instance Deku.Attribute.Attr everything Text Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "text", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Text String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "text", value: _ } <<< Deku.Attribute.prop'
