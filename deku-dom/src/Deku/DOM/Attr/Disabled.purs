module Deku.DOM.Attr.Disabled where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Disabled = Disabled

instance Deku.Attribute.Attr everything Disabled Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "disabled", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Fieldset_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Optgroup_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Option_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Output_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Disabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop'
