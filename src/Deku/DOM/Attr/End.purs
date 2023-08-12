module Deku.DOM.Attr.End where

import Prelude

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data End = End

instance Attr Animate_ End String where
  attr End value = unsafeAttribute { key: "end", value: prop' value }

instance Attr AnimateMotion_ End String where
  attr End value = unsafeAttribute { key: "end", value: prop' value }

instance Attr AnimateTransform_ End String where
  attr End value = unsafeAttribute { key: "end", value: prop' value }

instance Attr Set_ End String where
  attr End value = unsafeAttribute { key: "end", value: prop' value }

instance Attr everything End Unit where
  attr End _ = unsafeAttribute
    { key: "end", value: unset' }
