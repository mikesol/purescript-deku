module Deku.DOM.Attr.Rotate where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Text (Text_)

data Rotate = Rotate

instance Deku.Attribute.Attr everything Rotate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rotate", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Rotate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rotate", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Rotate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rotate", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Rotate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rotate", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Text_ Rotate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rotate", value: _ } <<< Deku.Attribute.prop'
