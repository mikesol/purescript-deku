module Deku.DOM.Attr.Color where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Link (Link_)

data Color = Color

instance Deku.Attribute.Attr everything Color Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "color", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Hr_ Color String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "color", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Color String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "color", value: _ } <<< Deku.Attribute.prop'
