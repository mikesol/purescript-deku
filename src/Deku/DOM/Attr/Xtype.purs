module Deku.DOM.Attr.Xtype where

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Xtype = Xtype

instance Attr Button_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Input_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Embed_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Object_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Script_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Source_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Style_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }

instance Attr Link_ Xtype String where
  attr Xtype value = unsafeAttribute { key: "type", value: prop' value }
