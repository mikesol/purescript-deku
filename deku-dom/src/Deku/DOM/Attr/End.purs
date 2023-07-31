module Deku.DOM.Attr.End where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data End = End

instance Deku.Attribute.Attr everything End Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "end", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ End String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "end", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ End String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "end", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ End String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "end", value: _ } <<< Deku.Attribute.prop'
