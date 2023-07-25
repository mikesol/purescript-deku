module Deku.DOM.Attr.Start where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Ol (Ol_)

data Start = Start

instance Deku.Attribute.Attr everything Start Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "start", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Ol_ Start String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "start", value: _ } <<< Deku.Attribute.prop'
