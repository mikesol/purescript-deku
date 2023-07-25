module Deku.DOM.Attr.Formtarget where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Formtarget = Formtarget

instance Deku.Attribute.Attr everything Formtarget Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "formtarget", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Formtarget String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formtarget", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Formtarget String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formtarget", value: _ } <<<
    Deku.Attribute.prop'
