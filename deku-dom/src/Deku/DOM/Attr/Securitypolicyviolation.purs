module Deku.DOM.Attr.Securitypolicyviolation where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Securitypolicyviolation = Securitypolicyviolation

instance Deku.Attribute.Attr everything Securitypolicyviolation Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "securitypolicyviolation", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Securitypolicyviolation String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "securitypolicyviolation", value: _ } <<<
    Deku.Attribute.prop'
