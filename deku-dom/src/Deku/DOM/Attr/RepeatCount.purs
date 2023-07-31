module Deku.DOM.Attr.RepeatCount where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data RepeatCount = RepeatCount

instance Deku.Attribute.Attr everything RepeatCount Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "repeatCount", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ RepeatCount String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "repeatCount", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ RepeatCount String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "repeatCount", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ RepeatCount String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "repeatCount", value: _ } <<<
    Deku.Attribute.prop'
