module Deku.DOM.Attr.AriaFlowto where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaFlowto = AriaFlowto

instance Deku.Attribute.Attr everything AriaFlowto Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-flowto", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaFlowto String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-flowto", value: _ } <<<
    Deku.Attribute.prop'
