module Deku.DOM.Attr.Integrity where

import Prelude

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Integrity = Integrity

instance Attr Link_ Integrity String where
  attr Integrity value = unsafeAttribute
    { key: "integrity", value: prop' value }

instance Attr Script_ Integrity String where
  attr Integrity value = unsafeAttribute
    { key: "integrity", value: prop' value }

instance Attr everything Integrity Unit where
  attr Integrity _ = unsafeAttribute
    { key: "integrity", value: unset' }
