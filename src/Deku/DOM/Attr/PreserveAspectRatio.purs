module Deku.DOM.Attr.PreserveAspectRatio where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PreserveAspectRatio = PreserveAspectRatio

instance Attr Tags.FeImage_ PreserveAspectRatio String where
  pureAttr PreserveAspectRatio value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "preserveAspectRatio", value }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: prop' value }

instance Attr Tags.Image_ PreserveAspectRatio String where
  pureAttr PreserveAspectRatio value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "preserveAspectRatio", value }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: prop' value }

instance Attr Tags.Marker_ PreserveAspectRatio String where
  pureAttr PreserveAspectRatio value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "preserveAspectRatio", value }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: prop' value }

instance Attr Tags.Pattern_ PreserveAspectRatio String where
  pureAttr PreserveAspectRatio value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "preserveAspectRatio", value }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: prop' value }

instance Attr Tags.Svg_ PreserveAspectRatio String where
  pureAttr PreserveAspectRatio value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "preserveAspectRatio", value }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: prop' value }

instance Attr Tags.Symbol_ PreserveAspectRatio String where
  pureAttr PreserveAspectRatio value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "preserveAspectRatio", value }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: prop' value }

instance Attr Tags.View_ PreserveAspectRatio String where
  pureAttr PreserveAspectRatio value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "preserveAspectRatio", value }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: prop' value }

instance Attr everything PreserveAspectRatio Unit where
  pureAttr PreserveAspectRatio _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: unset' }
  mapAttr PreserveAspectRatio evalue = unsafeAttribute $ Right $ evalue <#>
    \_ -> unsafeVolatileAttribute
      { key: "preserveAspectRatio", value: unset' }
