module Deku.DOM.Attr.Side where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.TextPath (TextPath_)

data Side = Side

instance Deku.Attribute.Attr everything Side Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "side", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr TextPath_ Side String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "side", value: _ } <<< Deku.Attribute.prop'
