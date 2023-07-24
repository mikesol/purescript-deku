module Deku.DOM.Attr.CalcMode where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)

data CalcMode = CalcMode

instance Deku.Attribute.Attr everything CalcMode Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "calcMode", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr AnimateMotion_ CalcMode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "calcMode", value: _ } <<< Deku.Attribute.prop'
