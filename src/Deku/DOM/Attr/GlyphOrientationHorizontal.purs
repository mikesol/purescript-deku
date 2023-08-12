module Deku.DOM.Attr.GlyphOrientationHorizontal where

import Prelude

import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GlyphOrientationHorizontal = GlyphOrientationHorizontal

instance Attr FeBlend_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeColorMatrix_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeComponentTransfer_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeComposite_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeConvolveMatrix_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeDiffuseLighting_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeDisplacementMap_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeFlood_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeGaussianBlur_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeImage_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeMerge_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeMorphology_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeOffset_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeSpecularLighting_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeTile_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr FeTurbulence_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Filter_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Image_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr Switch_ GlyphOrientationHorizontal String where
  attr GlyphOrientationHorizontal value = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: prop' value }

instance Attr everything GlyphOrientationHorizontal Unit where
  attr GlyphOrientationHorizontal _ = unsafeAttribute
    { key: "glyph-orientation-horizontal", value: unset' }
