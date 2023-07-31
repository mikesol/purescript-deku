module Deku.DOM.Attr.Srcdoc where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Iframe (Iframe_)

data Srcdoc = Srcdoc

instance Deku.Attribute.Attr everything Srcdoc Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "srcdoc", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Srcdoc String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "srcdoc", value: _ } <<< Deku.Attribute.prop'
