module Deku.DOM.Attr.KernelMatrix where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)

data KernelMatrix = KernelMatrix

instance Deku.Attribute.Attr everything KernelMatrix Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "kernelMatrix", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ KernelMatrix String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "kernelMatrix", value: _ } <<<
    Deku.Attribute.prop'
