module Deku.DOM.Attr.Formmethod where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Formmethod = Formmethod

instance Deku.Attribute.Attr everything Formmethod Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "formmethod", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Formmethod String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formmethod", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Formmethod String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formmethod", value: _ } <<<
    Deku.Attribute.prop'
