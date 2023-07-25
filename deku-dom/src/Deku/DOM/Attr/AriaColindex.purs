module Deku.DOM.Attr.AriaColindex where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaColindex = AriaColindex

instance Deku.Attribute.Attr everything AriaColindex Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-colindex", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaColindex String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-colindex", value: _ } <<<
    Deku.Attribute.prop'
