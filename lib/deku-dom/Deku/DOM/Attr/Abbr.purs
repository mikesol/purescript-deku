module Deku.DOM.Attr.Abbr where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)

data Abbr = Abbr

instance Deku.Attribute.Attr everything Abbr Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "abbr", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Td_ Abbr String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "abbr", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Abbr String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "abbr", value: _ } <<< Deku.Attribute.prop'
