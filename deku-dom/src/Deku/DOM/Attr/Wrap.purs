module Deku.DOM.Attr.Wrap where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Textarea (Textarea_)

data Wrap = Wrap

instance Deku.Attribute.Attr everything Wrap Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "wrap", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Textarea_ Wrap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "wrap", value: _ } <<< Deku.Attribute.prop'
