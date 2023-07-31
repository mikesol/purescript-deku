module Deku.DOM.Attr.Placeholder where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Placeholder = Placeholder

instance Deku.Attribute.Attr everything Placeholder Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "placeholder", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Placeholder String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "placeholder", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Placeholder String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "placeholder", value: _ } <<<
    Deku.Attribute.prop'
