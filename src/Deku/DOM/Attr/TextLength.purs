module Deku.DOM.Attr.TextLength where

import Prelude

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TextLength = TextLength

instance Attr Text_ TextLength String where
  attr TextLength value = unsafeAttribute
    { key: "textLength", value: prop' value }

instance Attr TextPath_ TextLength String where
  attr TextLength value = unsafeAttribute
    { key: "textLength", value: prop' value }

instance Attr Tspan_ TextLength String where
  attr TextLength value = unsafeAttribute
    { key: "textLength", value: prop' value }

instance Attr everything TextLength Unit where
  attr TextLength _ = unsafeAttribute
    { key: "textLength", value: unset' }
