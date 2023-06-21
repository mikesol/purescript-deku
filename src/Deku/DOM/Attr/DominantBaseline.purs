module Deku.DOM.Attr.DominantBaseline where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data DominantBaseline = DominantBaseline

instance Attr Tags.FeBlend_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeColorMatrix_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeComponentTransfer_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeComposite_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeDisplacementMap_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeFlood_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeGaussianBlur_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeImage_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeMerge_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeMorphology_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeOffset_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeSpecularLighting_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeTile_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.FeTurbulence_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.Filter_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.Image_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.Switch_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.Text_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr Tags.Tspan_ DominantBaseline String where
  pureAttr DominantBaseline value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dominant-baseline", value }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "dominant-baseline", value: prop' value }

instance Attr everything DominantBaseline Unit where
  pureAttr DominantBaseline _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dominant-baseline", value: unset' }
  mapAttr DominantBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "dominant-baseline", value: unset' }
