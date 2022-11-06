module Deku.DOM.Attr.Values where

import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Values = Values

instance Attr Animate_ Values String where
  attr Values value = unsafeAttribute { key: "values", value: prop' value }
instance Attr AnimateMotion_ Values String where
  attr Values value = unsafeAttribute { key: "values", value: prop' value }
instance Attr AnimateTransform_ Values String where
  attr Values value = unsafeAttribute { key: "values", value: prop' value }
instance Attr FeColorMatrix_ Values String where
  attr Values value = unsafeAttribute { key: "values", value: prop' value }