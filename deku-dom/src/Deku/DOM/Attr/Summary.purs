module Deku.DOM.Attr.Summary where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Table (Table_)

data Summary = Summary

instance Deku.Attribute.Attr everything Summary Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "summary", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Table_ Summary String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "summary", value: _ } <<< Deku.Attribute.prop'
