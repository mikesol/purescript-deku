module Deku.DOM.Attr.Fx where

import Prelude

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fx = Fx

instance Attr RadialGradient_ Fx String where
  attr Fx value = unsafeAttribute { key: "fx", value: prop' value }

instance Attr everything Fx Unit where
  attr Fx _ = unsafeAttribute
    { key: "fx", value: unset' }
