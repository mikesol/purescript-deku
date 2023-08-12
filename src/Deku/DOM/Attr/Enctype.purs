module Deku.DOM.Attr.Enctype where

import Prelude

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enctype = Enctype

instance Attr Form_ Enctype String where
  attr Enctype value = unsafeAttribute { key: "enctype", value: prop' value }

instance Attr everything Enctype Unit where
  attr Enctype _ = unsafeAttribute
    { key: "enctype", value: unset' }
