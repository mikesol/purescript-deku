module Deku.DOM.Attr.KernelMatrix where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data KernelMatrix = KernelMatrix

instance Attr Tags.FeConvolveMatrix_ KernelMatrix String where
  pureAttr KernelMatrix value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kernelMatrix", value }
  mapAttr KernelMatrix evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "kernelMatrix", value: prop' value }

instance Attr everything KernelMatrix Unit where
  pureAttr KernelMatrix _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "kernelMatrix", value: unset' }
  mapAttr KernelMatrix evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "kernelMatrix", value: unset' }
