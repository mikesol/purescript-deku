module Deku.DOM.Attr.Content where

import Prelude

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Content = Content

instance Attr Meta_ Content String where
  attr Content value = unsafeAttribute { key: "content", value: prop' value }

instance Attr everything Content Unit where
  attr Content _ = unsafeAttribute
    { key: "content", value: unset' }
