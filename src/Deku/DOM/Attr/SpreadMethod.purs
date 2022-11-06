module Deku.DOM.Attr.SpreadMethod where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data SpreadMethod = SpreadMethod

instance Attr LinearGradient_ SpreadMethod String where
  attr SpreadMethod value = unsafeAttribute
    { key: "spreadMethod", value: prop' value }

instance Attr RadialGradient_ SpreadMethod String where
  attr SpreadMethod value = unsafeAttribute
    { key: "spreadMethod", value: prop' value }