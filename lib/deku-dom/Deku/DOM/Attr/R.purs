module Deku.DOM.Attr.R where

import Prelude

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data R = R

instance Attr Circle_ R String where
  attr R value = unsafeAttribute { key: "r", value: prop' value }

instance Attr RadialGradient_ R String where
  attr R value = unsafeAttribute { key: "r", value: prop' value }

instance Attr everything R Unit where
  attr R _ = unsafeAttribute
    { key: "r", value: unset' }
