module Deku.DOM.Attr.Scheme where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Meta (Meta_)

data Scheme = Scheme

instance Deku.Attribute.Attr everything Scheme Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "scheme", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Meta_ Scheme String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scheme", value: _ } <<< Deku.Attribute.prop'
