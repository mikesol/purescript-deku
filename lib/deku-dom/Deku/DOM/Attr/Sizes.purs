module Deku.DOM.Attr.Sizes where

import Prelude

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sizes = Sizes

instance Attr Link_ Sizes String where
  attr Sizes value = unsafeAttribute { key: "sizes", value: prop' value }

instance Attr Img_ Sizes String where
  attr Sizes value = unsafeAttribute { key: "sizes", value: prop' value }

instance Attr Source_ Sizes String where
  attr Sizes value = unsafeAttribute { key: "sizes", value: prop' value }

instance Attr everything Sizes Unit where
  attr Sizes _ = unsafeAttribute
    { key: "sizes", value: unset' }
