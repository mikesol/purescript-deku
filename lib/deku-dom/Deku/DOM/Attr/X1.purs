module Deku.DOM.Attr.X1 where

import Prelude

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X1 = X1

instance Attr Line_ X1 String where
  attr X1 value = unsafeAttribute { key: "x1", value: prop' value }

instance Attr LinearGradient_ X1 String where
  attr X1 value = unsafeAttribute { key: "x1", value: prop' value }

instance Attr everything X1 Unit where
  attr X1 _ = unsafeAttribute
    { key: "x1", value: unset' }
