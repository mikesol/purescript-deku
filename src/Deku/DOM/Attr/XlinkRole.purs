module Deku.DOM.Attr.XlinkRole where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XlinkRole = XlinkRole

instance Attr Tags.AnimateTransform_ XlinkRole String where
  pureAttr XlinkRole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:role", value }
  mapAttr XlinkRole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:role", value: prop' value }

instance Attr Tags.FeImage_ XlinkRole String where
  pureAttr XlinkRole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:role", value }
  mapAttr XlinkRole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:role", value: prop' value }

instance Attr Tags.Filter_ XlinkRole String where
  pureAttr XlinkRole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:role", value }
  mapAttr XlinkRole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:role", value: prop' value }

instance Attr Tags.Image_ XlinkRole String where
  pureAttr XlinkRole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:role", value }
  mapAttr XlinkRole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:role", value: prop' value }

instance Attr Tags.Mpath_ XlinkRole String where
  pureAttr XlinkRole value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:role", value }
  mapAttr XlinkRole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:role", value: prop' value }

instance Attr everything XlinkRole Unit where
  pureAttr XlinkRole _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xlink:role", value: unset' }
  mapAttr XlinkRole evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:role", value: unset' }
