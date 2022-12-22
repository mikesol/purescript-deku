module Deku.DOM.Attr.Path where

import Prelude

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Path = Path

instance Attr AnimateMotion_ Path String where
  attr Path value = unsafeAttribute { key: "path", value: prop' value }

instance Attr TextPath_ Path String where
  attr Path value = unsafeAttribute { key: "path", value: prop' value }

instance Attr everything Path Unit where
  attr Path _ = unsafeAttribute
    { key: "path", value: unset' }
