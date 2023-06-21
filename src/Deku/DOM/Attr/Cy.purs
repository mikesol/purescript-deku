module Deku.DOM.Attr.Cy where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Cy = Cy

instance Attr Tags.Circle_ Cy String where
  pureAttr Cy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cy", value }

  mapAttr Cy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cy", value: prop' value }

instance Attr Tags.Ellipse_ Cy String where
  pureAttr Cy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cy", value }

  mapAttr Cy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cy", value: prop' value }

instance Attr Tags.RadialGradient_ Cy String where
  pureAttr Cy value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "cy", value }

  mapAttr Cy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cy", value: prop' value }

instance Attr everything Cy Unit where
  pureAttr Cy _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "cy", value: unset' }
  mapAttr Cy evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cy", value: unset' }
