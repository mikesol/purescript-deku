module Deku.DOM.Attr.Manifest where
import Deku.DOM.Elt.Html(Html_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Manifest = Manifest
instance Attr Html_ Manifest String where
  attr Manifest value = unsafeAttribute { key: "manifest", value: prop' value }
