module Deku.DOM.Attr.Path where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.TextPath (TextPath_)

data Path = Path

instance Deku.Attribute.Attr everything Path Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "path", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr AnimateMotion_ Path String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "path", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ Path String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "path", value: _ } <<< Deku.Attribute.prop'
