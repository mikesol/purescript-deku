module Deku.DOM.Attr.Shape where

import Prelude

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Shape = Shape

instance Attr A_ Shape String where
  attr Shape value = unsafeAttribute { key: "shape", value: prop' value }

instance Attr Area_ Shape String where
  attr Shape value = unsafeAttribute { key: "shape", value: prop' value }

instance Attr everything Shape Unit where
  attr Shape _ = unsafeAttribute
    { key: "shape", value: unset' }
