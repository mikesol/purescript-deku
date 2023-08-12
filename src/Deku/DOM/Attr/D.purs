module Deku.DOM.Attr.D where

import Prelude

import Deku.DOM.Elt.Path (Path_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data D = D

instance Attr Path_ D String where
  attr D value = unsafeAttribute { key: "d", value: prop' value }

instance Attr everything D Unit where
  attr D _ = unsafeAttribute
    { key: "d", value: unset' }
