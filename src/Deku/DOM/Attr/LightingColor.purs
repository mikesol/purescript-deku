module Deku.DOM.Attr.LightingColor where

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

data LightingColor = LightingColor

instance Attr FeBlend_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeColorMatrix_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeComponentTransfer_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeComposite_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeConvolveMatrix_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeDiffuseLighting_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeDisplacementMap_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeFlood_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeGaussianBlur_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeImage_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeMerge_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeMorphology_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeOffset_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeSpecularLighting_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeTile_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr FeTurbulence_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr Filter_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr Image_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr Switch_ LightingColor String where
  attr LightingColor value = unsafeAttribute
    { key: "lighting-color", value: prop' value }

instance Attr everything LightingColor Unit where
  attr LightingColor _ = unsafeAttribute
    { key: "lighting-color", value: unset' }
