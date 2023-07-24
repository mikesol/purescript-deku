module Deku.DOM.Attr.Maxlength where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Maxlength = Maxlength

instance Deku.Attribute.Attr everything Maxlength Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "maxlength", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Maxlength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "maxlength", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Maxlength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "maxlength", value: _ } <<<
    Deku.Attribute.prop'
