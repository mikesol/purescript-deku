module Deku.DOM.Attr.Y1 where

import Prelude

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Y1 = Y1

instance Attr Line_ Y1 String where
  attr Y1 value = unsafeAttribute { key: "y1", value: prop' value }

instance Attr LinearGradient_ Y1 String where
  attr Y1 value = unsafeAttribute { key: "y1", value: prop' value }

instance Attr everything Y1 Unit where
  attr Y1 _ = unsafeAttribute
    { key: "y1", value: unset' }
