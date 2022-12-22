module Deku.DOM.Attr.Srcdoc where

import Prelude

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcdoc = Srcdoc

instance Attr Iframe_ Srcdoc String where
  attr Srcdoc value = unsafeAttribute { key: "srcdoc", value: prop' value }

instance Attr everything Srcdoc Unit where
  attr Srcdoc _ = unsafeAttribute
    { key: "srcdoc", value: unset' }
