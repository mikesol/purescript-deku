module Deku.DOM.Attr.Beforetoggle where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Beforetoggle = Beforetoggle

instance Deku.Attribute.Attr everything Beforetoggle Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "beforetoggle", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Beforetoggle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforetoggle", value: _ } <<<
    Deku.Attribute.prop'
