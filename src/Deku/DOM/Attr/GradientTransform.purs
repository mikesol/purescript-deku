module Deku.DOM.Attr.GradientTransform where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data GradientTransform = GradientTransform

instance Attr Tags.LinearGradient_ GradientTransform String where
  pureAttr GradientTransform value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "gradientTransform", value }
  mapAttr GradientTransform evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "gradientTransform", value: prop' value }

instance Attr Tags.RadialGradient_ GradientTransform String where
  pureAttr GradientTransform value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "gradientTransform", value }
  mapAttr GradientTransform evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "gradientTransform", value: prop' value }

instance Attr everything GradientTransform Unit where
  pureAttr GradientTransform _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "gradientTransform", value: unset' }
  mapAttr GradientTransform evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "gradientTransform", value: unset' }
