module Deku.DOM.Attr.Dur where

import Prelude

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dur = Dur

instance Attr Animate_ Dur String where
  attr Dur value = unsafeAttribute { key: "dur", value: prop' value }

instance Attr AnimateMotion_ Dur String where
  attr Dur value = unsafeAttribute { key: "dur", value: prop' value }

instance Attr AnimateTransform_ Dur String where
  attr Dur value = unsafeAttribute { key: "dur", value: prop' value }

instance Attr Set_ Dur String where
  attr Dur value = unsafeAttribute { key: "dur", value: prop' value }

instance Attr everything Dur Unit where
  attr Dur _ = unsafeAttribute
    { key: "dur", value: unset' }
