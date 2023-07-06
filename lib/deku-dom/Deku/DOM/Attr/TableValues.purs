module Deku.DOM.Attr.TableValues where

import Prelude

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TableValues = TableValues

instance Attr FeFuncA_ TableValues String where
  attr TableValues value = unsafeAttribute
    { key: "tableValues", value: prop' value }

instance Attr FeFuncB_ TableValues String where
  attr TableValues value = unsafeAttribute
    { key: "tableValues", value: prop' value }

instance Attr FeFuncG_ TableValues String where
  attr TableValues value = unsafeAttribute
    { key: "tableValues", value: prop' value }

instance Attr FeFuncR_ TableValues String where
  attr TableValues value = unsafeAttribute
    { key: "tableValues", value: prop' value }

instance Attr everything TableValues Unit where
  attr TableValues _ = unsafeAttribute
    { key: "tableValues", value: unset' }
