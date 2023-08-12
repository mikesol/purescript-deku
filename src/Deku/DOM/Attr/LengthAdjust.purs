module Deku.DOM.Attr.LengthAdjust where

import Prelude

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LengthAdjust = LengthAdjust

instance Attr Text_ LengthAdjust String where
  attr LengthAdjust value = unsafeAttribute
    { key: "lengthAdjust", value: prop' value }

instance Attr TextPath_ LengthAdjust String where
  attr LengthAdjust value = unsafeAttribute
    { key: "lengthAdjust", value: prop' value }

instance Attr Tspan_ LengthAdjust String where
  attr LengthAdjust value = unsafeAttribute
    { key: "lengthAdjust", value: prop' value }

instance Attr everything LengthAdjust Unit where
  attr LengthAdjust _ = unsafeAttribute
    { key: "lengthAdjust", value: unset' }
