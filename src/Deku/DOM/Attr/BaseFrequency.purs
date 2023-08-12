module Deku.DOM.Attr.BaseFrequency where

import Prelude

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency String where
  attr BaseFrequency value = unsafeAttribute
    { key: "baseFrequency", value: prop' value }

instance Attr everything BaseFrequency Unit where
  attr BaseFrequency _ = unsafeAttribute
    { key: "baseFrequency", value: unset' }
