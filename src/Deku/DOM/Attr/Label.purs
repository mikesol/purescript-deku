module Deku.DOM.Attr.Label where

import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Label = Label

instance Attr Optgroup_ Label String where
  attr Label value = unsafeAttribute { key: "label", value: prop' value }

instance Attr Option_ Label String where
  attr Label value = unsafeAttribute { key: "label", value: prop' value }

instance Attr Track_ Label String where
  attr Label value = unsafeAttribute { key: "label", value: prop' value }
