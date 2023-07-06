module Deku.DOM.Attr.Default where

import Prelude

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Default = Default

instance Attr Track_ Default String where
  attr Default value = unsafeAttribute { key: "default", value: prop' value }

instance Attr everything Default Unit where
  attr Default _ = unsafeAttribute
    { key: "default", value: unset' }
