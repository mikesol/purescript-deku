module Deku.DOM.Attr.FontSizeAdjust where

import Prelude

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
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

data FontSizeAdjust = FontSizeAdjust

instance Attr FeBlend_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeColorMatrix_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeComponentTransfer_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeComposite_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeConvolveMatrix_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeDiffuseLighting_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeDisplacementMap_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeFlood_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeGaussianBlur_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeImage_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeMerge_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeMorphology_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeOffset_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeSpecularLighting_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeTile_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr FeTurbulence_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr Filter_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr Image_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr Switch_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr Text_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr Tspan_ FontSizeAdjust String where
  attr FontSizeAdjust value = unsafeAttribute
    { key: "font-size-adjust", value: prop' value }

instance Attr everything FontSizeAdjust Unit where
  attr FontSizeAdjust _ = unsafeAttribute
    { key: "font-size-adjust", value: unset' }
