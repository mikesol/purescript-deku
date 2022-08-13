module Deku.DOM.Attr.Value where

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.DOM.Elt.Param (Param_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Value = Value

instance Attr Button_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Input_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Li_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Meter_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Option_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Progress_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

instance Attr Param_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }
