module Deku.DOM.Attr.Checked where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Input (Input_)

data Checked = Checked

instance Deku.Attribute.Attr everything Checked Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "checked", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Checked String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "checked", value: _ } <<< Deku.Attribute.prop'
