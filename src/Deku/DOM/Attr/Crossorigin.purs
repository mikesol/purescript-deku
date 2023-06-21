module Deku.DOM.Attr.Crossorigin where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Crossorigin = Crossorigin

instance Attr Tags.Audio_ Crossorigin String where
  pureAttr Crossorigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "crossorigin", value }
  mapAttr Crossorigin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "crossorigin", value: prop' value }

instance Attr Tags.Img_ Crossorigin String where
  pureAttr Crossorigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "crossorigin", value }
  mapAttr Crossorigin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "crossorigin", value: prop' value }

instance Attr Tags.Link_ Crossorigin String where
  pureAttr Crossorigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "crossorigin", value }
  mapAttr Crossorigin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "crossorigin", value: prop' value }

instance Attr Tags.Script_ Crossorigin String where
  pureAttr Crossorigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "crossorigin", value }
  mapAttr Crossorigin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "crossorigin", value: prop' value }

instance Attr Tags.Video_ Crossorigin String where
  pureAttr Crossorigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "crossorigin", value }
  mapAttr Crossorigin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "crossorigin", value: prop' value }

instance Attr Tags.Image_ Crossorigin String where
  pureAttr Crossorigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "crossorigin", value }
  mapAttr Crossorigin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "crossorigin", value: prop' value }

instance Attr everything Crossorigin Unit where
  pureAttr Crossorigin _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "crossorigin", value: unset' }
  mapAttr Crossorigin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "crossorigin", value: unset' }
