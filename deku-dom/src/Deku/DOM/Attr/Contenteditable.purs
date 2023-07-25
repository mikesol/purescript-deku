module Deku.DOM.Attr.Contenteditable where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Contenteditable = Contenteditable

instance Deku.Attribute.Attr everything Contenteditable Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "contenteditable", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Contenteditable String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "contenteditable", value: _ } <<<
    Deku.Attribute.prop'
