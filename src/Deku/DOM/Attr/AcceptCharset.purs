module Deku.DOM.Attr.AcceptCharset where

import Prelude

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AcceptCharset = AcceptCharset

instance Attr Form_ AcceptCharset String where
  attr AcceptCharset value = unsafeAttribute
    { key: "accept-charset", value: prop' value }

instance Attr everything AcceptCharset Unit where
  attr AcceptCharset _ = unsafeAttribute
    { key: "accept-charset", value: unset' }
