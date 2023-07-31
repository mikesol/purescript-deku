module Deku.DOM.Attr.Span where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)

data Span = Span

instance Deku.Attribute.Attr everything Span Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "span", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Col_ Span String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "span", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Colgroup_ Span String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "span", value: _ } <<< Deku.Attribute.prop'
