module Deku.DOM.Attr.Formenctype where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Formenctype = Formenctype

instance Deku.Attribute.Attr everything Formenctype Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "formenctype", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Formenctype String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formenctype", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Formenctype String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formenctype", value: _ } <<<
    Deku.Attribute.prop'
