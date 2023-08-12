module Deku.DOM.Attr.Additive where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Additive = Additive

instance Attr Animate_ Additive String where
  attr Additive value = unsafeAttribute { key: "additive", value: prop' value }

instance Attr AnimateMotion_ Additive String where
  attr Additive value = unsafeAttribute { key: "additive", value: prop' value }

instance Attr AnimateTransform_ Additive String where
  attr Additive value = unsafeAttribute { key: "additive", value: prop' value }

instance Attr everything Additive Unit where
  attr Additive _ = unsafeAttribute
    { key: "additive", value: unset' }
