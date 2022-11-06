module Deku.DOM.Attr.ViewTarget where

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data ViewTarget = ViewTarget

instance Attr View_ ViewTarget String where
  attr ViewTarget value = unsafeAttribute { key: "viewTarget", value: prop' value }