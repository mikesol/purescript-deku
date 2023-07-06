module Deku.DOM.Attr.Cite where

import Prelude

import Deku.DOM.Elt.Blockquote (Blockquote_)
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Q (Q_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cite = Cite

instance Attr Blockquote_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr Del_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr Ins_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr Q_ Cite String where
  attr Cite value = unsafeAttribute { key: "cite", value: prop' value }

instance Attr everything Cite Unit where
  attr Cite _ = unsafeAttribute
    { key: "cite", value: unset' }
