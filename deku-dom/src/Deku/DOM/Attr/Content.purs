module Deku.DOM.Attr.Content where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Meta (Meta_)

data Content = Content

instance Deku.Attribute.Attr everything Content Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "content", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Meta_ Content String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "content", value: _ } <<< Deku.Attribute.prop'
