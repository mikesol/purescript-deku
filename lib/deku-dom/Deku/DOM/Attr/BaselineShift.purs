module Deku.DOM.Attr.BaselineShift where

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

data BaselineShift = BaselineShift

instance Attr FeBlend_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeColorMatrix_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeComponentTransfer_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeComposite_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeConvolveMatrix_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeDiffuseLighting_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeDisplacementMap_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeFlood_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeGaussianBlur_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeImage_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeMerge_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeMorphology_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeOffset_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeSpecularLighting_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeTile_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr FeTurbulence_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr Filter_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr Image_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr Switch_ BaselineShift String where
  attr BaselineShift value = unsafeAttribute
    { key: "baseline-shift", value: prop' value }

instance Attr everything BaselineShift Unit where
  attr BaselineShift _ = unsafeAttribute
    { key: "baseline-shift", value: unset' }