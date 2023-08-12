module Deku.DOM.Attr.WordSpacing where

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

data WordSpacing = WordSpacing

instance Attr FeBlend_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeColorMatrix_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeComponentTransfer_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeComposite_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeConvolveMatrix_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeDiffuseLighting_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeDisplacementMap_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeFlood_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeGaussianBlur_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeImage_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeMerge_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeMorphology_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeOffset_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeSpecularLighting_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeTile_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr FeTurbulence_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr Filter_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr Image_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr Switch_ WordSpacing String where
  attr WordSpacing value = unsafeAttribute
    { key: "word-spacing", value: prop' value }

instance Attr everything WordSpacing Unit where
  attr WordSpacing _ = unsafeAttribute
    { key: "word-spacing", value: unset' }
