module Deku.DOM.Attr.Minlength where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Minlength = Minlength

instance Deku.Attribute.Attr everything Minlength Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "minlength", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Minlength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "minlength", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Minlength String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "minlength", value: _ } <<<
    Deku.Attribute.prop'
