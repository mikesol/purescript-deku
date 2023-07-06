module Deku.DOM.Attr.Azimuth where

import Prelude

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Azimuth = Azimuth

instance Attr FeDistantLight_ Azimuth String where
  attr Azimuth value = unsafeAttribute { key: "azimuth", value: prop' value }

instance Attr everything Azimuth Unit where
  attr Azimuth _ = unsafeAttribute
    { key: "azimuth", value: unset' }
