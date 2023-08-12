module Deku.DOM.Attr.MarkerMid where

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

data MarkerMid = MarkerMid

instance Attr FeBlend_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeColorMatrix_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeComponentTransfer_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeComposite_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeConvolveMatrix_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeDiffuseLighting_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeDisplacementMap_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeFlood_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeGaussianBlur_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeImage_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeMerge_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeMorphology_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeOffset_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeSpecularLighting_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeTile_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr FeTurbulence_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr Filter_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr Image_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr Switch_ MarkerMid String where
  attr MarkerMid value = unsafeAttribute
    { key: "marker-mid", value: prop' value }

instance Attr everything MarkerMid Unit where
  attr MarkerMid _ = unsafeAttribute
    { key: "marker-mid", value: unset' }
