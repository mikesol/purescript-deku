module Deku.DOM.Attr.Decelerate where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decelerate = Decelerate

instance Attr AnimateTransform_ Decelerate String where
  attr Decelerate value = unsafeAttribute
    { key: "decelerate", value: prop' value }

instance Attr everything Decelerate Unit where
  attr Decelerate _ = unsafeAttribute
    { key: "decelerate", value: unset' }
