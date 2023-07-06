module Deku.DOM.Attr.XmlSpace where

import Prelude

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Metadata (Metadata_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XmlSpace = XmlSpace

instance Attr AnimateTransform_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr Discard_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeBlend_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeColorMatrix_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeComponentTransfer_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeComposite_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeConvolveMatrix_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeDiffuseLighting_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeDisplacementMap_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeDistantLight_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeFlood_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeFuncA_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeFuncB_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeFuncG_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeFuncR_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeGaussianBlur_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeImage_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeMerge_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeMergeNode_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeMorphology_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeOffset_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FePointLight_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeSpecularLighting_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeSpotLight_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeTile_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr FeTurbulence_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr Filter_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr Image_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr Metadata_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr Mpath_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr Switch_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr View_ XmlSpace String where
  attr XmlSpace value = unsafeAttribute { key: "xml:space", value: prop' value }

instance Attr everything XmlSpace Unit where
  attr XmlSpace _ = unsafeAttribute
    { key: "xml:space", value: unset' }
