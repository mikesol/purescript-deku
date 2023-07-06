module Deku.DOM.Attr.KernelUnitLength where

import Prelude

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelUnitLength = KernelUnitLength

instance Attr FeConvolveMatrix_ KernelUnitLength String where
  attr KernelUnitLength value = unsafeAttribute
    { key: "kernelUnitLength", value: prop' value }

instance Attr FeDiffuseLighting_ KernelUnitLength String where
  attr KernelUnitLength value = unsafeAttribute
    { key: "kernelUnitLength", value: prop' value }

instance Attr FeSpecularLighting_ KernelUnitLength String where
  attr KernelUnitLength value = unsafeAttribute
    { key: "kernelUnitLength", value: prop' value }

instance Attr everything KernelUnitLength Unit where
  attr KernelUnitLength _ = unsafeAttribute
    { key: "kernelUnitLength", value: unset' }
