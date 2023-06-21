module Deku.DOM.Attr.GlyphOrientationVertical where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data GlyphOrientationVertical = GlyphOrientationVertical

instance Attr Tags.FeBlend_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeColorMatrix_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeComponentTransfer_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeComposite_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeDisplacementMap_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeFlood_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeGaussianBlur_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeImage_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeMerge_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeMorphology_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeOffset_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeSpecularLighting_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeTile_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.FeTurbulence_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.Filter_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.Image_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr Tags.Switch_ GlyphOrientationVertical String where
  pureAttr GlyphOrientationVertical value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "glyph-orientation-vertical", value }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: prop' value }

instance Attr everything GlyphOrientationVertical Unit where
  pureAttr GlyphOrientationVertical _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: unset' }
  mapAttr GlyphOrientationVertical evalue = unsafeAttribute $ Right $ evalue <#>
    \_ -> unsafeVolatileAttribute
      { key: "glyph-orientation-vertical", value: unset' }
