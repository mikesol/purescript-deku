module Deku.DOM.Attr.Amplitude where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Amplitude = Amplitude

instance Attr Tags.FeFuncA_ Amplitude String where
  pureAttr Amplitude value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "amplitude", value }
  mapAttr Amplitude evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "amplitude", value: prop' value }

instance Attr Tags.FeFuncB_ Amplitude String where
  pureAttr Amplitude value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "amplitude", value }
  mapAttr Amplitude evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "amplitude", value: prop' value }

instance Attr Tags.FeFuncG_ Amplitude String where
  pureAttr Amplitude value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "amplitude", value }
  mapAttr Amplitude evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "amplitude", value: prop' value }

instance Attr Tags.FeFuncR_ Amplitude String where
  pureAttr Amplitude value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "amplitude", value }
  mapAttr Amplitude evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "amplitude", value: prop' value }

instance Attr everything Amplitude Unit where
  pureAttr Amplitude _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "amplitude", value: unset' }
  mapAttr Amplitude evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "amplitude", value: unset' }
