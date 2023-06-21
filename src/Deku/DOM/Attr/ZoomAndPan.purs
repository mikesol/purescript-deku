module Deku.DOM.Attr.ZoomAndPan where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ZoomAndPan = ZoomAndPan

instance Attr Tags.View_ ZoomAndPan String where
  pureAttr ZoomAndPan value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "zoomAndPan", value }
  mapAttr ZoomAndPan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "zoomAndPan", value: prop' value }

instance Attr everything ZoomAndPan Unit where
  pureAttr ZoomAndPan _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "zoomAndPan", value: unset' }
  mapAttr ZoomAndPan evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "zoomAndPan", value: unset' }
