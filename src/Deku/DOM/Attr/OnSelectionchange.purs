module Deku.DOM.Attr.OnSelectionchange where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSelectionchange = OnSelectionchange
instance Attr anything OnSelectionchange Cb where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb' value }