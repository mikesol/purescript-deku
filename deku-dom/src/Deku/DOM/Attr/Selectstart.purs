module Deku.DOM.Attr.Selectstart where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Selectstart = Selectstart

instance Deku.Attribute.Attr everything Selectstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "selectstart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Selectstart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "selectstart", value: _ } <<<
    Deku.Attribute.prop'
