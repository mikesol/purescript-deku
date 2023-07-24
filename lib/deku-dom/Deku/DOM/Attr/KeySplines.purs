module Deku.DOM.Attr.KeySplines where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data KeySplines = KeySplines

instance Deku.Attribute.Attr everything KeySplines Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keySplines", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ KeySplines String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keySplines", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ KeySplines String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keySplines", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ KeySplines String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keySplines", value: _ } <<<
    Deku.Attribute.prop'
