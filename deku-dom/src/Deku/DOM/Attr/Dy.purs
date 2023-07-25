module Deku.DOM.Attr.Dy where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.Text (Text_)

data Dy = Dy

instance Deku.Attribute.Attr everything Dy Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dy", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDropShadow_ Dy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dy", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ Dy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dy", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Text_ Dy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dy", value: _ } <<< Deku.Attribute.prop'
