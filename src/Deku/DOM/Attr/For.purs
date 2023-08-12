module Deku.DOM.Attr.For where

import Prelude

import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Output (Output_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data For = For

instance Attr Label_ For String where
  attr For value = unsafeAttribute { key: "for", value: prop' value }

instance Attr Output_ For String where
  attr For value = unsafeAttribute { key: "for", value: prop' value }

instance Attr everything For Unit where
  attr For _ = unsafeAttribute
    { key: "for", value: unset' }
