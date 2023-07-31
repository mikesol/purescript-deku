module Deku.DOM.Attr.Noshade where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Hr (Hr_)

data Noshade = Noshade

instance Deku.Attribute.Attr everything Noshade Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "noshade", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Hr_ Noshade String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "noshade", value: _ } <<< Deku.Attribute.prop'
