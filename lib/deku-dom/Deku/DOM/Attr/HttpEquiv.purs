module Deku.DOM.Attr.HttpEquiv where

import Prelude

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data HttpEquiv = HttpEquiv

instance Attr Meta_ HttpEquiv String where
  attr HttpEquiv value = unsafeAttribute
    { key: "http-equiv", value: prop' value }

instance Attr everything HttpEquiv Unit where
  attr HttpEquiv _ = unsafeAttribute
    { key: "http-equiv", value: unset' }
