module Deku.DOM.Attr.In2 where

import Prelude

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data In2 = In2

instance Attr FeBlend_ In2 String where
  attr In2 value = unsafeAttribute { key: "in2", value: prop' value }

instance Attr FeComposite_ In2 String where
  attr In2 value = unsafeAttribute { key: "in2", value: prop' value }

instance Attr FeDisplacementMap_ In2 String where
  attr In2 value = unsafeAttribute { key: "in2", value: prop' value }

instance Attr everything In2 Unit where
  attr In2 _ = unsafeAttribute
    { key: "in2", value: unset' }
