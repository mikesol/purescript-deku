module Deku.DOM.Attr.Seed where

import Prelude

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Seed = Seed

instance Attr FeTurbulence_ Seed String where
  attr Seed value = unsafeAttribute { key: "seed", value: prop' value }

instance Attr everything Seed Unit where
  attr Seed _ = unsafeAttribute
    { key: "seed", value: unset' }
