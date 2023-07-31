module Deku.DOM.Attr.KernelUnitLength where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)

data KernelUnitLength = KernelUnitLength

instance Deku.Attribute.Attr everything KernelUnitLength Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "kernelUnitLength", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ KernelUnitLength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "kernelUnitLength", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDiffuseLighting_ KernelUnitLength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "kernelUnitLength", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ KernelUnitLength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "kernelUnitLength", value: _ } <<<
    Deku.Attribute.prop'
