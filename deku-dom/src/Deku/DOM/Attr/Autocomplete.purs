module Deku.DOM.Attr.Autocomplete where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Autocomplete = Autocomplete

instance Deku.Attribute.Attr everything Autocomplete Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "autocomplete", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Fieldset_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Output_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Autocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<<
    Deku.Attribute.prop'
