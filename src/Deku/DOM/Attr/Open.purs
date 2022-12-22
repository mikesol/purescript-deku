module Deku.DOM.Attr.Open where

import Prelude

import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Open = Open

instance Attr Details_ Open String where
  attr Open value = unsafeAttribute { key: "open", value: prop' value }

instance Attr Dialog_ Open String where
  attr Open value = unsafeAttribute { key: "open", value: prop' value }

instance Attr everything Open Unit where
  attr Open _ = unsafeAttribute
    { key: "open", value: unset' }
