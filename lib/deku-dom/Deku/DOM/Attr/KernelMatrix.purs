module Deku.DOM.Attr.KernelMatrix where

import Prelude

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelMatrix = KernelMatrix

instance Attr FeConvolveMatrix_ KernelMatrix String where
  attr KernelMatrix value = unsafeAttribute
    { key: "kernelMatrix", value: prop' value }

instance Attr everything KernelMatrix Unit where
  attr KernelMatrix _ = unsafeAttribute
    { key: "kernelMatrix", value: unset' }
