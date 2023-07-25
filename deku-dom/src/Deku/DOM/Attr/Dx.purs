module Deku.DOM.Attr.Dx where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.Text (Text_)

data Dx = Dx

instance Deku.Attribute.Attr everything Dx Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dx", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDropShadow_ Dx String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dx", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ Dx String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dx", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Text_ Dx String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dx", value: _ } <<< Deku.Attribute.prop'
