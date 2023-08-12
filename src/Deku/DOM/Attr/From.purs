module Deku.DOM.Attr.From where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data From = From

instance Attr Animate_ From String where
  attr From value = unsafeAttribute { key: "from", value: prop' value }

instance Attr AnimateMotion_ From String where
  attr From value = unsafeAttribute { key: "from", value: prop' value }

instance Attr AnimateTransform_ From String where
  attr From value = unsafeAttribute { key: "from", value: prop' value }

instance Attr everything From Unit where
  attr From _ = unsafeAttribute
    { key: "from", value: unset' }
