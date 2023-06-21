module Deku.DOM.Attr.XlinkShow where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XlinkShow = XlinkShow

instance Attr Tags.AnimateTransform_ XlinkShow String where
  pureAttr XlinkShow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:show", value }
  mapAttr XlinkShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:show", value: prop' value }

instance Attr Tags.FeImage_ XlinkShow String where
  pureAttr XlinkShow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:show", value }
  mapAttr XlinkShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:show", value: prop' value }

instance Attr Tags.Filter_ XlinkShow String where
  pureAttr XlinkShow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:show", value }
  mapAttr XlinkShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:show", value: prop' value }

instance Attr Tags.Image_ XlinkShow String where
  pureAttr XlinkShow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:show", value }
  mapAttr XlinkShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:show", value: prop' value }

instance Attr Tags.Mpath_ XlinkShow String where
  pureAttr XlinkShow value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:show", value }
  mapAttr XlinkShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:show", value: prop' value }

instance Attr everything XlinkShow Unit where
  pureAttr XlinkShow _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xlink:show", value: unset' }
  mapAttr XlinkShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:show", value: unset' }
