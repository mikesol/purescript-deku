module Deku.DOM.Attr.In2 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)

data In2 = In2

instance Deku.Attribute.Attr everything In2 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "in2", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeBlend_ In2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in2", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComposite_ In2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in2", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDisplacementMap_ In2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in2", value: _ } <<< Deku.Attribute.prop'
