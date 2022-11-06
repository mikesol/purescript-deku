module Deku.DOM.Attr.Slope where

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Slope = Slope

instance Attr FeFuncA_ Slope String where
  attr Slope value = unsafeAttribute { key: "slope", value: prop' value }

instance Attr FeFuncB_ Slope String where
  attr Slope value = unsafeAttribute { key: "slope", value: prop' value }

instance Attr FeFuncG_ Slope String where
  attr Slope value = unsafeAttribute { key: "slope", value: prop' value }

instance Attr FeFuncR_ Slope String where
  attr Slope value = unsafeAttribute { key: "slope", value: prop' value }