module Deku.DOM.Attr.MarkerEnd where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MarkerEnd = MarkerEnd

instance Attr Tags.FeBlend_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeColorMatrix_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeComponentTransfer_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeComposite_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeDisplacementMap_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeFlood_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeGaussianBlur_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeImage_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeMerge_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeMorphology_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeOffset_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeSpecularLighting_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeTile_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.FeTurbulence_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.Filter_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.Image_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr Tags.Switch_ MarkerEnd String where
  pureAttr MarkerEnd value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-end", value }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: prop' value }

instance Attr everything MarkerEnd Unit where
  pureAttr MarkerEnd _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "marker-end", value: unset' }
  mapAttr MarkerEnd evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-end", value: unset' }
