module Deku.DOM.Attr.NumOctaves where

import Prelude

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data NumOctaves = NumOctaves

instance Attr FeTurbulence_ NumOctaves String where
  attr NumOctaves value = unsafeAttribute
    { key: "numOctaves", value: prop' value }

instance Attr everything NumOctaves Unit where
  attr NumOctaves _ = unsafeAttribute
    { key: "numOctaves", value: unset' }
