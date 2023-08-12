module Deku.DOM.Attr.Async where

import Prelude

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Async = Async

instance Attr Script_ Async String where
  attr Async value = unsafeAttribute { key: "async", value: prop' value }

instance Attr everything Async Unit where
  attr Async _ = unsafeAttribute
    { key: "async", value: unset' }
