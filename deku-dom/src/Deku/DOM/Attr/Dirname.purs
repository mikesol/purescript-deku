module Deku.DOM.Attr.Dirname where

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

data Dirname = Dirname

instance Deku.Attribute.Attr everything Dirname Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dirname", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Dirname String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Fieldset_ Dirname String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Dirname String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Dirname String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Output_ Dirname String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Dirname String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Dirname String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop'
