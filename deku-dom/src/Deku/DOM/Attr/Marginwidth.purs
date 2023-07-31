module Deku.DOM.Attr.Marginwidth where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Iframe (Iframe_)

data Marginwidth = Marginwidth

instance Deku.Attribute.Attr everything Marginwidth Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "marginwidth", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Marginwidth String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marginwidth", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Marginwidth String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marginwidth", value: _ } <<<
    Deku.Attribute.prop'
