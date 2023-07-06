module Deku.DOM.Attr.Width where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
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
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Width = Width

instance Attr Canvas_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Embed_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Iframe_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Img_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Input_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Object_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Video_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeBlend_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeColorMatrix_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeComponentTransfer_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeComposite_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeConvolveMatrix_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeDiffuseLighting_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeDisplacementMap_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeDropShadow_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeFlood_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeGaussianBlur_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeImage_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeMerge_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeMorphology_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeOffset_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeSpecularLighting_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeTile_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr FeTurbulence_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Filter_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr ForeignObject_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Image_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Mask_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Pattern_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Rect_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Svg_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Symbol_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Use_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr everything Width Unit where
  attr Width _ = unsafeAttribute
    { key: "width", value: unset' }
