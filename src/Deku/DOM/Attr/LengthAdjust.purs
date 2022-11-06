module Deku.DOM.Attr.LengthAdjust where

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

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