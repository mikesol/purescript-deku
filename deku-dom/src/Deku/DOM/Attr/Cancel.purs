module Deku.DOM.Attr.Cancel where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Cancel = Cancel

instance Deku.Attribute.Attr everything Cancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cancel", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Cancel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cancel", value: _ } <<< Deku.Attribute.prop'
