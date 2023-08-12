module Deku.DOM.Attr.AlignmentBaseline where

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

data AlignmentBaseline = AlignmentBaseline

instance Attr FeBlend_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeColorMatrix_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeComponentTransfer_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeComposite_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeConvolveMatrix_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeDiffuseLighting_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeDisplacementMap_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeFlood_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeGaussianBlur_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeImage_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeMerge_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeMorphology_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeOffset_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeSpecularLighting_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeTile_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr FeTurbulence_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr Filter_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr Image_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr Switch_ AlignmentBaseline String where
  attr AlignmentBaseline value = unsafeAttribute
    { key: "alignment-baseline", value: prop' value }

instance Attr everything AlignmentBaseline Unit where
  attr AlignmentBaseline _ = unsafeAttribute
    { key: "alignment-baseline", value: unset' }
