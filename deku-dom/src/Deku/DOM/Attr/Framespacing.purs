module Deku.DOM.Attr.Framespacing where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Iframe (Iframe_)

data Framespacing = Framespacing

instance Deku.Attribute.Attr everything Framespacing Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "framespacing", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Framespacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "framespacing", value: _ } <<<
    Deku.Attribute.prop'
