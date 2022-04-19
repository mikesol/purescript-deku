module Deku.DOM.Attr.Max where
import Deku.DOM.Elt.Input(Input_)
import Deku.DOM.Elt.Meter(Meter_)
import Deku.DOM.Elt.Progress(Progress_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Max = Max
instance Attr Input_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Meter_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }

instance Attr Progress_ Max String where
  attr Max value = unsafeAttribute { key: "max", value: prop' value }
