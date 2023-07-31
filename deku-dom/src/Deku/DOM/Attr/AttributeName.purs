module Deku.DOM.Attr.AttributeName where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data AttributeName = AttributeName

instance Deku.Attribute.Attr everything AttributeName Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "attributeName", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ AttributeName String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "attributeName", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ AttributeName String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "attributeName", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ AttributeName String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "attributeName", value: _ } <<<
    Deku.Attribute.prop'
