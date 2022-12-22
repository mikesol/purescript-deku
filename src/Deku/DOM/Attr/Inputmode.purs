module Deku.DOM.Attr.Inputmode where

import Prelude

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Inputmode = Inputmode

instance Attr Textarea_ Inputmode String where
  attr Inputmode value = unsafeAttribute
    { key: "inputmode", value: prop' value }

instance Attr everything Inputmode Unit where
  attr Inputmode _ = unsafeAttribute
    { key: "inputmode", value: unset' }
