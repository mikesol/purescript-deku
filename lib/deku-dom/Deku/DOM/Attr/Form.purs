module Deku.DOM.Attr.Form where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Form = Form

instance Deku.Attribute.Attr everything Form Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "form", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Form String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Fieldset_ Form String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Form String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Form String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Output_ Form String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Form String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Form String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop'
