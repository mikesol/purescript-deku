module Deku.DOM.Attr.Datetime where

import Prelude

import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Time (Time_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Datetime = Datetime

instance Attr Del_ Datetime String where
  attr Datetime value = unsafeAttribute { key: "datetime", value: prop' value }

instance Attr Ins_ Datetime String where
  attr Datetime value = unsafeAttribute { key: "datetime", value: prop' value }

instance Attr Time_ Datetime String where
  attr Datetime value = unsafeAttribute { key: "datetime", value: prop' value }

instance Attr everything Datetime Unit where
  attr Datetime _ = unsafeAttribute
    { key: "datetime", value: unset' }
