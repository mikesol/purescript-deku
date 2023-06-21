module Deku.DOM.Attr.GlyphOrientationHorizontal where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data GlyphOrientationHorizontal = GlyphOrientationHorizontal

instance Attr Tags.FeBlend_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeColorMatrix_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeComponentTransfer_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeComposite_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeDisplacementMap_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeFlood_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeGaussianBlur_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeImage_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeMerge_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeMorphology_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeOffset_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeSpecularLighting_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeTile_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.FeTurbulence_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.Filter_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.Image_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Tags.Switch_ GlyphOrientationHorizontal String where
  pureAttr GlyphOrientationHorizontal value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-horizontal", value }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr everything GlyphOrientationHorizontal Unit where
  pureAttr GlyphOrientationHorizontal _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: unset' }
  mapAttr GlyphOrientationHorizontal evalue = unsafeAttribute $ Right $ evalue
    <#> \_ -> unsafeVolatileAttribute
      { key: "glyph-orientation-horizontal", value: unset' }
