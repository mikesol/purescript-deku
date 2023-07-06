module Deku.DOM.Attr.FloodOpacity where

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
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FloodOpacity = FloodOpacity

instance Attr FeBlend_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeColorMatrix_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeComponentTransfer_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeComposite_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeDisplacementMap_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeDropShadow_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeFlood_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeGaussianBlur_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeImage_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeMerge_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeMorphology_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeOffset_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeSpecularLighting_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeTile_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr FeTurbulence_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr Filter_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr Image_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr Switch_ FloodOpacity String where
  attr FloodOpacity value = unsafeAttribute
    { key: "flood-opacity", value: prop' value }

instance Attr everything FloodOpacity Unit where
  attr FloodOpacity _ = unsafeAttribute
    { key: "flood-opacity", value: unset' }
