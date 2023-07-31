module Deku.DOM.Attr.Nonce where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Nonce = Nonce

instance Deku.Attribute.Attr everything Nonce Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "nonce", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Nonce String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "nonce", value: _ } <<< Deku.Attribute.prop'
