module Deku.DOM.Attr.ViewTarget where

import Prelude

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewTarget = ViewTarget

instance Attr View_ ViewTarget String where
  attr ViewTarget value = unsafeAttribute
    { key: "viewTarget", value: prop' value }

instance Attr everything ViewTarget Unit where
  attr ViewTarget _ = unsafeAttribute
    { key: "viewTarget", value: unset' }
