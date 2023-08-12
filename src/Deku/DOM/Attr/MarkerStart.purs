module Deku.DOM.Attr.MarkerStart where

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

data MarkerStart = MarkerStart

instance Attr FeBlend_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeColorMatrix_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeComponentTransfer_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeComposite_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeConvolveMatrix_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeDiffuseLighting_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeDisplacementMap_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeFlood_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeGaussianBlur_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeImage_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeMerge_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeMorphology_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeOffset_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeSpecularLighting_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeTile_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr FeTurbulence_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr Filter_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr Image_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr Switch_ MarkerStart String where
  attr MarkerStart value = unsafeAttribute
    { key: "marker-start", value: prop' value }

instance Attr everything MarkerStart Unit where
  attr MarkerStart _ = unsafeAttribute
    { key: "marker-start", value: unset' }
