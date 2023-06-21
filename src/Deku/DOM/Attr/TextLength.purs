module Deku.DOM.Attr.TextLength where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TextLength = TextLength

instance Attr Tags.Text_ TextLength String where
  pureAttr TextLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "textLength", value }
  mapAttr TextLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "textLength", value: prop' value }

instance Attr Tags.TextPath_ TextLength String where
  pureAttr TextLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "textLength", value }
  mapAttr TextLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "textLength", value: prop' value }

instance Attr Tags.Tspan_ TextLength String where
  pureAttr TextLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "textLength", value }
  mapAttr TextLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "textLength", value: prop' value }

instance Attr everything TextLength Unit where
  pureAttr TextLength _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "textLength", value: unset' }
  mapAttr TextLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "textLength", value: unset' }
