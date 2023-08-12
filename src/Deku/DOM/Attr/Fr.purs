module Deku.DOM.Attr.Fr where

import Prelude

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fr = Fr

instance Attr RadialGradient_ Fr String where
  attr Fr value = unsafeAttribute { key: "fr", value: prop' value }

instance Attr everything Fr Unit where
  attr Fr _ = unsafeAttribute
    { key: "fr", value: unset' }
