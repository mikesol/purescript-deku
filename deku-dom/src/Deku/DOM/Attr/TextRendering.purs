module Deku.DOM.Attr.TextRendering where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data TextRendering = TextRendering

instance Deku.Attribute.Attr everything TextRendering Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "text-rendering", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything TextRendering String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "text-rendering", value: _ } <<<
    Deku.Attribute.prop'
