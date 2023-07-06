module Deku.DOM.Attr.Codebase where

import Prelude

import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Codebase = Codebase

instance Attr Applet_ Codebase String where
  attr Codebase value = unsafeAttribute { key: "codebase", value: prop' value }

instance Attr everything Codebase Unit where
  attr Codebase _ = unsafeAttribute
    { key: "codebase", value: unset' }
