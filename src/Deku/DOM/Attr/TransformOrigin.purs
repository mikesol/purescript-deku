module Deku.DOM.Attr.TransformOrigin where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TransformOrigin = TransformOrigin

instance Attr Tags.FeBlend_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeColorMatrix_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeComponentTransfer_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeComposite_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeDisplacementMap_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeFlood_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeGaussianBlur_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeImage_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeMerge_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeMorphology_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeOffset_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeSpecularLighting_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeTile_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.FeTurbulence_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.Filter_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.Image_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr Tags.Switch_ TransformOrigin String where
  pureAttr TransformOrigin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "transform-origin", value }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "transform-origin", value: prop' value }

instance Attr everything TransformOrigin Unit where
  pureAttr TransformOrigin _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transform-origin", value: unset' }
  mapAttr TransformOrigin evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transform-origin", value: unset' }
