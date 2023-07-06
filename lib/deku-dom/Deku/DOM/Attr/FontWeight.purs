module Deku.DOM.Attr.FontWeight where

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

data FontWeight = FontWeight

instance Attr FeBlend_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeColorMatrix_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeComponentTransfer_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeComposite_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeConvolveMatrix_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeDiffuseLighting_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeDisplacementMap_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeFlood_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeGaussianBlur_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeImage_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeMerge_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeMorphology_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeOffset_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeSpecularLighting_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeTile_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr FeTurbulence_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr Filter_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr Image_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr Switch_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr Text_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr Tspan_ FontWeight String where
  attr FontWeight value = unsafeAttribute
    { key: "font-weight", value: prop' value }

instance Attr everything FontWeight Unit where
  attr FontWeight _ = unsafeAttribute
    { key: "font-weight", value: unset' }
