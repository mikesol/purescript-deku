module Deku.DOM.Attr.Y where

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

data Y = Y

instance Attr FeBlend_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeColorMatrix_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeComponentTransfer_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeComposite_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeConvolveMatrix_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeDiffuseLighting_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeDisplacementMap_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeDropShadow_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeFlood_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeGaussianBlur_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeImage_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeMerge_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeMorphology_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeOffset_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FePointLight_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeSpecularLighting_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeSpotLight_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeTile_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr FeTurbulence_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Filter_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr ForeignObject_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Image_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Mask_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Pattern_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Rect_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Svg_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Symbol_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Text_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Tspan_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr Use_ Y String where
  attr Y value = unsafeAttribute { key: "y", value: prop' value }

instance Attr everything Y Unit where
  attr Y _ = unsafeAttribute
    { key: "y", value: unset' }
