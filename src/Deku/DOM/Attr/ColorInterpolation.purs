module Deku.DOM.Attr.ColorInterpolation where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data ColorInterpolation = ColorInterpolation

instance Attr Tags.Circle_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Defs_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Ellipse_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeBlend_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeColorMatrix_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeComponentTransfer_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeComposite_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeDisplacementMap_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeFlood_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeGaussianBlur_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeImage_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeMerge_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeMorphology_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeOffset_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeSpecularLighting_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeTile_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.FeTurbulence_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Filter_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.ForeignObject_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.G_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Image_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Line_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.LinearGradient_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Marker_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Path_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Pattern_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Polygon_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Polyline_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.RadialGradient_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Rect_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Svg_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Switch_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Symbol_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Text_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.TextPath_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Tspan_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr Tags.Use_ ColorInterpolation String where
  pureAttr ColorInterpolation value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "color-interpolation", value }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "color-interpolation", value: prop' value }

instance Attr everything ColorInterpolation Unit where
  pureAttr ColorInterpolation _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "color-interpolation", value: unset' }
  mapAttr ColorInterpolation evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "color-interpolation", value: unset' }
