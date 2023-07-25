module Deku.DOM.Attr.PreserveAspectRatio where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.Svg (Svg_)

data PreserveAspectRatio = PreserveAspectRatio

instance Deku.Attribute.Attr everything PreserveAspectRatio Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "preserveAspectRatio", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeImage_ PreserveAspectRatio String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "preserveAspectRatio", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Svg_ PreserveAspectRatio String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "preserveAspectRatio", value: _ } <<<
    Deku.Attribute.prop'
