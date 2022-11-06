module Deku.DOM.Attr.CalcMode where

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data CalcMode = CalcMode

instance Attr Animate_ CalcMode String where
  attr CalcMode value = unsafeAttribute { key: "calcMode", value: prop' value }
instance Attr AnimateMotion_ CalcMode String where
  attr CalcMode value = unsafeAttribute { key: "calcMode", value: prop' value }
instance Attr AnimateTransform_ CalcMode String where
  attr CalcMode value = unsafeAttribute { key: "calcMode", value: prop' value }