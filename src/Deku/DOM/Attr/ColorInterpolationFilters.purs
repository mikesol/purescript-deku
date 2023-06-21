module Deku.DOM.Attr.ColorInterpolationFilters where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ColorInterpolationFilters = ColorInterpolationFilters

instance Attr Tags.FeBlend_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeColorMatrix_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeComposite_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeFlood_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeImage_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeMerge_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeMorphology_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeOffset_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeTile_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.FeTurbulence_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.Filter_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.Image_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr Tags.Switch_ ColorInterpolationFilters String where
  pureAttr ColorInterpolationFilters value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation-filters", value }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: prop' value }

instance Attr everything ColorInterpolationFilters Unit where
  pureAttr ColorInterpolationFilters _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: unset' }
  mapAttr ColorInterpolationFilters evalue = unsafeAttribute $ Right $ evalue
    <#> \_ -> unsafeVolatileAttribute
      { key: "color-interpolation-filters", value: unset' }
