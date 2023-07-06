module Deku.DOM.Attr.Fy where

import Prelude

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fy = Fy

instance Attr RadialGradient_ Fy String where
  attr Fy value = unsafeAttribute { key: "fy", value: prop' value }

instance Attr everything Fy Unit where
  attr Fy _ = unsafeAttribute
    { key: "fy", value: unset' }
