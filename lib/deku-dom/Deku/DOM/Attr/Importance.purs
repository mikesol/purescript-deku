module Deku.DOM.Attr.Importance where

import Prelude

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Importance = Importance

instance Attr Iframe_ Importance String where
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr Img_ Importance String where
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr Link_ Importance String where
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr Script_ Importance String where
  attr Importance value = unsafeAttribute
    { key: "importance", value: prop' value }

instance Attr everything Importance Unit where
  attr Importance _ = unsafeAttribute
    { key: "importance", value: unset' }
