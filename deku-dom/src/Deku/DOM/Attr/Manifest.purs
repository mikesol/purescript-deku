module Deku.DOM.Attr.Manifest where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Html (Html_)

data Manifest = Manifest

instance Deku.Attribute.Attr everything Manifest Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "manifest", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Html_ Manifest String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "manifest", value: _ } <<< Deku.Attribute.prop'
