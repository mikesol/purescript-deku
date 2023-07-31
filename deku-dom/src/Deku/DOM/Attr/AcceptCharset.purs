module Deku.DOM.Attr.AcceptCharset where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Form (Form_)

data AcceptCharset = AcceptCharset

instance Deku.Attribute.Attr everything AcceptCharset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "accept-charset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Form_ AcceptCharset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "accept-charset", value: _ } <<<
    Deku.Attribute.prop'
