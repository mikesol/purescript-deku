module Deku.DOM.Attr.Enctype where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Enctype = Enctype

instance Deku.Attribute.Attr everything Enctype Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "enctype", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Enctype String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "enctype", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Enctype String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "enctype", value: _ } <<< Deku.Attribute.prop'
