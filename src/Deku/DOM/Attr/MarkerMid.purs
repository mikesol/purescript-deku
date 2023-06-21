module Deku.DOM.Attr.MarkerMid where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MarkerMid = MarkerMid

instance Attr Tags.FeBlend_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeColorMatrix_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeComponentTransfer_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeComposite_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeDisplacementMap_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeFlood_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeGaussianBlur_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeImage_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeMerge_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeMorphology_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeOffset_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeSpecularLighting_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeTile_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.FeTurbulence_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.Filter_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.Image_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr Tags.Switch_ MarkerMid String where
  pureAttr MarkerMid value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "marker-mid", value }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: prop' value }

instance Attr everything MarkerMid Unit where
  pureAttr MarkerMid _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "marker-mid", value: unset' }
  mapAttr MarkerMid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "marker-mid", value: unset' }
