module Deku.DOM.Attr.Formdata where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Formdata = Formdata

instance Deku.Attribute.Attr everything Formdata Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "formdata", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Formdata String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formdata", value: _ } <<< Deku.Attribute.prop'
