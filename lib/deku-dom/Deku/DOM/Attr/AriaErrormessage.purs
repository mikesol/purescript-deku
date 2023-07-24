module Deku.DOM.Attr.AriaErrormessage where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaErrormessage = AriaErrormessage

instance Deku.Attribute.Attr everything AriaErrormessage Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-errormessage", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaErrormessage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-errormessage", value: _ } <<<
    Deku.Attribute.prop'
