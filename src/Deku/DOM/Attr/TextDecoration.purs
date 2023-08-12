module Deku.DOM.Attr.TextDecoration where

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

data TextDecoration = TextDecoration

instance Attr FeBlend_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeColorMatrix_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeComponentTransfer_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeComposite_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeConvolveMatrix_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeDiffuseLighting_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeDisplacementMap_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeFlood_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeGaussianBlur_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeImage_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeMerge_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeMorphology_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeOffset_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeSpecularLighting_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeTile_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr FeTurbulence_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr Filter_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr Image_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr Switch_ TextDecoration String where
  attr TextDecoration value = unsafeAttribute
    { key: "text-decoration", value: prop' value }

instance Attr everything TextDecoration Unit where
  attr TextDecoration _ = unsafeAttribute
    { key: "text-decoration", value: unset' }
