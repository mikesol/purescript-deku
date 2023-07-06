module Deku.DOM.Attr.Manifest where

import Prelude

import Deku.DOM.Elt.Html (Html_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Manifest = Manifest

instance Attr Html_ Manifest String where
  attr Manifest value = unsafeAttribute { key: "manifest", value: prop' value }

instance Attr everything Manifest Unit where
  attr Manifest _ = unsafeAttribute
    { key: "manifest", value: unset' }
