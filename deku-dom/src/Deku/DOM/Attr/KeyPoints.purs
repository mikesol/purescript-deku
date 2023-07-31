module Deku.DOM.Attr.KeyPoints where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data KeyPoints = KeyPoints

instance Deku.Attribute.Attr everything KeyPoints Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keyPoints", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ KeyPoints String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyPoints", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ KeyPoints String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyPoints", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ KeyPoints String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyPoints", value: _ } <<<
    Deku.Attribute.prop'
