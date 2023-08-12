module Deku.DOM.Attr.UnicodeBidi where

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

data UnicodeBidi = UnicodeBidi

instance Attr FeBlend_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeColorMatrix_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeComponentTransfer_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeComposite_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeConvolveMatrix_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeDiffuseLighting_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeDisplacementMap_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeFlood_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeGaussianBlur_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeImage_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeMerge_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeMorphology_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeOffset_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeSpecularLighting_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeTile_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr FeTurbulence_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr Filter_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr Image_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr Switch_ UnicodeBidi String where
  attr UnicodeBidi value = unsafeAttribute
    { key: "unicode-bidi", value: prop' value }

instance Attr everything UnicodeBidi Unit where
  attr UnicodeBidi _ = unsafeAttribute
    { key: "unicode-bidi", value: unset' }
