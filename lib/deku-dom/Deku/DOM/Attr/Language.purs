module Deku.DOM.Attr.Language where

import Prelude

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Language = Language

instance Attr Script_ Language String where
  attr Language value = unsafeAttribute { key: "language", value: prop' value }

instance Attr everything Language Unit where
  attr Language _ = unsafeAttribute
    { key: "language", value: unset' }
