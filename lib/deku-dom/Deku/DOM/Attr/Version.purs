module Deku.DOM.Attr.Version where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Html (Html_)

data Version = Version

instance Deku.Attribute.Attr everything Version Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "version", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Html_ Version String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "version", value: _ } <<< Deku.Attribute.prop'
