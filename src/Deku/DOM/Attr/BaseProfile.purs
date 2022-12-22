module Deku.DOM.Attr.BaseProfile where

import Prelude

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseProfile = BaseProfile

instance Attr Svg_ BaseProfile String where
  attr BaseProfile value = unsafeAttribute
    { key: "baseProfile", value: prop' value }

instance Attr everything BaseProfile Unit where
  attr BaseProfile _ = unsafeAttribute
    { key: "baseProfile", value: unset' }
