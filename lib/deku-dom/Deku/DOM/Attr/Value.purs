module Deku.DOM.Attr.Value where

import Prelude

import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Param (Param_)
import Deku.DOM.Elt.Progress (Progress_)

data Value = Value

instance Attr Textarea_ Value String where
  attr Value value = unsafeAttribute { key: "value", value: prop' value }

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

instance Attr everything Value Unit where
  attr Value _ = unsafeAttribute
    { key: "value", value: unset' }
