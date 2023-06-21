module Deku.DOM.Attr.MarkerStart where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MarkerStart = MarkerStart

instance Attr Tags.FeBlend_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeColorMatrix_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeComponentTransfer_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeComposite_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeDisplacementMap_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeFlood_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeGaussianBlur_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeImage_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeMerge_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeMorphology_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeOffset_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeSpecularLighting_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeTile_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.FeTurbulence_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.Filter_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.Image_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr Tags.Switch_ MarkerStart String where
  pureAttr MarkerStart value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-start", value }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: prop' value }

instance Attr everything MarkerStart Unit where
  pureAttr MarkerStart _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "marker-start", value: unset' }
  mapAttr MarkerStart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-start", value: unset' }
