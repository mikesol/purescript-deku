module Deku.DOM.Attr.Sandbox where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Iframe (Iframe_)

data Sandbox = Sandbox

instance Deku.Attribute.Attr everything Sandbox Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "sandbox", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Sandbox String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "sandbox", value: _ } <<< Deku.Attribute.prop'
