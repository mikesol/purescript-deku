module Deku.DOM.Attr.Src where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Src = Src

instance Attr Tags.Audio_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Embed_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Iframe_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Img_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Input_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Script_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Source_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Track_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr Tags.Video_ Src String where
  pureAttr Src value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "src", value }

  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "src", value: prop' value }

instance Attr everything Src Unit where
  pureAttr Src _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "src", value: unset' }
  mapAttr Src evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "src", value: unset' }
