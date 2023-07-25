module Deku.DOM.Attr.Headers where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)

data Headers = Headers

instance Deku.Attribute.Attr everything Headers Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "headers", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Td_ Headers String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "headers", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Headers String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "headers", value: _ } <<< Deku.Attribute.prop'
