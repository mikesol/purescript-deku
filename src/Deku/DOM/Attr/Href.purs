module Deku.DOM.Attr.Href where

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Href = Href

instance Attr A_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }

instance Attr Area_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }

instance Attr Base_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }

instance Attr Link_ Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop' value }
