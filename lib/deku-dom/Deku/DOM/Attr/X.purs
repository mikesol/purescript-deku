module Deku.DOM.Attr.X where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
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
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
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
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X = X

instance Attr FeBlend_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeColorMatrix_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeComponentTransfer_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeComposite_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeConvolveMatrix_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeDiffuseLighting_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeDisplacementMap_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeDropShadow_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeFlood_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeGaussianBlur_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeImage_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeMerge_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeMorphology_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeOffset_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FePointLight_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeSpecularLighting_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeSpotLight_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeTile_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr FeTurbulence_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Filter_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr ForeignObject_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Image_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Mask_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Pattern_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Rect_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Svg_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Symbol_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Text_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Tspan_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr Use_ X String where
  attr X value = unsafeAttribute { key: "x", value: prop' value }

instance Attr everything X Unit where
  attr X _ = unsafeAttribute
    { key: "x", value: unset' }
