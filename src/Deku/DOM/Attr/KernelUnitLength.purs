module Deku.DOM.Attr.KernelUnitLength where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data KernelUnitLength = KernelUnitLength

instance Attr Tags.FeConvolveMatrix_ KernelUnitLength String where
  pureAttr KernelUnitLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kernelUnitLength", value }
  mapAttr KernelUnitLength evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "kernelUnitLength", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ KernelUnitLength String where
  pureAttr KernelUnitLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kernelUnitLength", value }
  mapAttr KernelUnitLength evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "kernelUnitLength", value: prop' value }

instance Attr Tags.FeSpecularLighting_ KernelUnitLength String where
  pureAttr KernelUnitLength value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "kernelUnitLength", value }
  mapAttr KernelUnitLength evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "kernelUnitLength", value: prop' value }

instance Attr everything KernelUnitLength Unit where
  pureAttr KernelUnitLength _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "kernelUnitLength", value: unset' }
  mapAttr KernelUnitLength evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "kernelUnitLength", value: unset' }
