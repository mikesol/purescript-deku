module Deku.DOM.Attr.Restart where

import Prelude

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Restart = Restart

instance Attr Animate_ Restart String where
  attr Restart value = unsafeAttribute { key: "restart", value: prop' value }

instance Attr AnimateMotion_ Restart String where
  attr Restart value = unsafeAttribute { key: "restart", value: prop' value }

instance Attr AnimateTransform_ Restart String where
  attr Restart value = unsafeAttribute { key: "restart", value: prop' value }

instance Attr Set_ Restart String where
  attr Restart value = unsafeAttribute { key: "restart", value: prop' value }

instance Attr everything Restart Unit where
  attr Restart _ = unsafeAttribute
    { key: "restart", value: unset' }
