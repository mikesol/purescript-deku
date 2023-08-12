module Deku.DOM.Attr.DominantBaseline where

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

data DominantBaseline = DominantBaseline

instance Attr FeBlend_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeColorMatrix_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeComponentTransfer_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeComposite_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeConvolveMatrix_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeDiffuseLighting_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeDisplacementMap_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeFlood_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeGaussianBlur_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeImage_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeMerge_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeMorphology_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeOffset_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeSpecularLighting_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeTile_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr FeTurbulence_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr Filter_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr Image_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr Switch_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr Text_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr Tspan_ DominantBaseline String where
  attr DominantBaseline value = unsafeAttribute
    { key: "dominant-baseline", value: prop' value }

instance Attr everything DominantBaseline Unit where
  attr DominantBaseline _ = unsafeAttribute
    { key: "dominant-baseline", value: unset' }
