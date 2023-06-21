module Deku.DOM.Attr.Alt where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Alt = Alt

instance Attr Tags.Applet_ Alt String where
  pureAttr Alt value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "alt", value }

  mapAttr Alt evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "alt", value: prop' value }

instance Attr Tags.Area_ Alt String where
  pureAttr Alt value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "alt", value }

  mapAttr Alt evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "alt", value: prop' value }

instance Attr Tags.Img_ Alt String where
  pureAttr Alt value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "alt", value }

  mapAttr Alt evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "alt", value: prop' value }

instance Attr Tags.Input_ Alt String where
  pureAttr Alt value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "alt", value }

  mapAttr Alt evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "alt", value: prop' value }

instance Attr everything Alt Unit where
  pureAttr Alt _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "alt", value: unset' }
  mapAttr Alt evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "alt", value: unset' }
