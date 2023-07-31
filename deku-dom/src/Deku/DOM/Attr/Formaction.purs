module Deku.DOM.Attr.Formaction where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Formaction = Formaction

instance Deku.Attribute.Attr everything Formaction Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "formaction", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Formaction String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formaction", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Formaction String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formaction", value: _ } <<<
    Deku.Attribute.prop'
