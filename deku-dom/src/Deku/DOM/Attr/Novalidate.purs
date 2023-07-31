module Deku.DOM.Attr.Novalidate where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Novalidate = Novalidate

instance Deku.Attribute.Attr everything Novalidate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "novalidate", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Novalidate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "novalidate", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Novalidate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "novalidate", value: _ } <<<
    Deku.Attribute.prop'
