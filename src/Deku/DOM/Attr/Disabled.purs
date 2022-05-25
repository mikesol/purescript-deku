module Deku.DOM.Attr.Disabled where

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Disabled = Disabled

instance Attr Button_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Fieldset_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Input_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Optgroup_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Option_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Select_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }

instance Attr Textarea_ Disabled String where
  attr Disabled value = unsafeAttribute { key: "disabled", value: prop' value }
