module Deku.DOM.Attr.AutoReverse where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AutoReverse = AutoReverse

instance Attr AnimateTransform_ AutoReverse String where
  attr AutoReverse value = unsafeAttribute
    { key: "autoReverse", value: prop' value }

instance Attr everything AutoReverse Unit where
  attr AutoReverse _ = unsafeAttribute
    { key: "autoReverse", value: unset' }
