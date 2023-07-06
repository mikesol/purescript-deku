module Deku.DOM.Attr.Intercept where

import Prelude

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intercept = Intercept

instance Attr FeFuncA_ Intercept String where
  attr Intercept value = unsafeAttribute
    { key: "intercept", value: prop' value }

instance Attr FeFuncB_ Intercept String where
  attr Intercept value = unsafeAttribute
    { key: "intercept", value: prop' value }

instance Attr FeFuncG_ Intercept String where
  attr Intercept value = unsafeAttribute
    { key: "intercept", value: prop' value }

instance Attr FeFuncR_ Intercept String where
  attr Intercept value = unsafeAttribute
    { key: "intercept", value: prop' value }

instance Attr everything Intercept Unit where
  attr Intercept _ = unsafeAttribute
    { key: "intercept", value: unset' }
