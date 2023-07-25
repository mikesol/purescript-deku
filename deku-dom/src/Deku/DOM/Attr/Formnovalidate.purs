module Deku.DOM.Attr.Formnovalidate where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Formnovalidate = Formnovalidate

instance Deku.Attribute.Attr everything Formnovalidate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "formnovalidate", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Formnovalidate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formnovalidate", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Formnovalidate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "formnovalidate", value: _ } <<<
    Deku.Attribute.prop'
