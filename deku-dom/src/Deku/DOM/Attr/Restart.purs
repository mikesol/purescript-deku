module Deku.DOM.Attr.Restart where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data Restart = Restart

instance Deku.Attribute.Attr everything Restart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "restart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Restart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "restart", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Restart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "restart", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Restart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "restart", value: _ } <<< Deku.Attribute.prop'
