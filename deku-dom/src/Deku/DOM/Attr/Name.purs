module Deku.DOM.Attr.Name where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Map (Map_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Slot (Slot_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Name = Name

instance Deku.Attribute.Attr everything Name Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "name", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Embed_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Fieldset_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Map_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Meta_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Option_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Output_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Slot_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Name String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< Deku.Attribute.prop'
