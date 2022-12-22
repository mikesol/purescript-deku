module Deku.DOM.Attr.By where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data By = By

instance Attr Animate_ By String where
  attr By value = unsafeAttribute { key: "by", value: prop' value }

instance Attr AnimateMotion_ By String where
  attr By value = unsafeAttribute { key: "by", value: prop' value }

instance Attr AnimateTransform_ By String where
  attr By value = unsafeAttribute { key: "by", value: prop' value }

instance Attr everything By Unit where
  attr By _ = unsafeAttribute
    { key: "by", value: unset' }
