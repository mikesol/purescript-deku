module Deku.DOM.Attr.EdgeMode where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data EdgeMode = EdgeMode

instance Attr Tags.FeConvolveMatrix_ EdgeMode String where
  pureAttr EdgeMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "edgeMode", value }

  mapAttr EdgeMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "edgeMode", value: prop' value }

instance Attr Tags.FeGaussianBlur_ EdgeMode String where
  pureAttr EdgeMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "edgeMode", value }

  mapAttr EdgeMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "edgeMode", value: prop' value }

instance Attr everything EdgeMode Unit where
  pureAttr EdgeMode _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "edgeMode", value: unset' }
  mapAttr EdgeMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "edgeMode", value: unset' }
