module Deku.DOM.Attr.TextAnchor where

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

data TextAnchor = TextAnchor

instance Attr FeBlend_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeColorMatrix_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeComponentTransfer_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeComposite_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeConvolveMatrix_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeDiffuseLighting_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeDisplacementMap_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeFlood_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeGaussianBlur_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeImage_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeMerge_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeMorphology_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeOffset_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeSpecularLighting_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeTile_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr FeTurbulence_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr Filter_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr Image_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr Switch_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr Text_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr Tspan_ TextAnchor String where
  attr TextAnchor value = unsafeAttribute
    { key: "text-anchor", value: prop' value }

instance Attr everything TextAnchor Unit where
  attr TextAnchor _ = unsafeAttribute
    { key: "text-anchor", value: unset' }
