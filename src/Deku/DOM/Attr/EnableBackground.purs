module Deku.DOM.Attr.EnableBackground where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data EnableBackground = EnableBackground

instance Attr Tags.FeBlend_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeColorMatrix_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeComponentTransfer_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeComposite_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeDisplacementMap_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeFlood_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeGaussianBlur_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeImage_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeMerge_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeMorphology_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeOffset_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeSpecularLighting_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeTile_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.FeTurbulence_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.Filter_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.Image_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr Tags.Switch_ EnableBackground String where
  pureAttr EnableBackground value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "enable-background", value }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "enable-background", value: prop' value }

instance Attr everything EnableBackground Unit where
  pureAttr EnableBackground _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "enable-background", value: unset' }
  mapAttr EnableBackground evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "enable-background", value: unset' }
