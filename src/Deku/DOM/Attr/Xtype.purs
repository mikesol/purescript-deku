module Deku.DOM.Attr.Xtype where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Xtype = Xtype

instance Attr Tags.Button_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.Input_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.Embed_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.Object_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.Script_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.Source_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.Style_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.Link_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.AnimateTransform_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeColorMatrix_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncA_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncB_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncG_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeFuncR_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr Tags.FeTurbulence_ Xtype String where
  pureAttr Xtype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "type", value }

  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "type", value: prop' value }

instance Attr everything Xtype Unit where
  pureAttr Xtype _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "type", value: unset' }
  mapAttr Xtype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "type", value: unset' }
