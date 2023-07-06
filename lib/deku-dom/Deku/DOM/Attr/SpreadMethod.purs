module Deku.DOM.Attr.SpreadMethod where

import Prelude

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpreadMethod = SpreadMethod

instance Attr LinearGradient_ SpreadMethod String where
  attr SpreadMethod value = unsafeAttribute
    { key: "spreadMethod", value: prop' value }

instance Attr RadialGradient_ SpreadMethod String where
  attr SpreadMethod value = unsafeAttribute
    { key: "spreadMethod", value: prop' value }

instance Attr everything SpreadMethod Unit where
  attr SpreadMethod _ = unsafeAttribute
    { key: "spreadMethod", value: unset' }
