module Deku.DOM.Attr.KernelMatrix where

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data KernelMatrix = KernelMatrix

instance Attr FeConvolveMatrix_ KernelMatrix String where
  attr KernelMatrix value = unsafeAttribute { key: "kernelMatrix", value: prop' value }