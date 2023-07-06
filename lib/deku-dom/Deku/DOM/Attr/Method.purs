module Deku.DOM.Attr.Method where

import Prelude

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Method = Method

instance Attr Form_ Method String where
  attr Method value = unsafeAttribute { key: "method", value: prop' value }

instance Attr TextPath_ Method String where
  attr Method value = unsafeAttribute { key: "method", value: prop' value }

instance Attr everything Method Unit where
  attr Method _ = unsafeAttribute
    { key: "method", value: unset' }
