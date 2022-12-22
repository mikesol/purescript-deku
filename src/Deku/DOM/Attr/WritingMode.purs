module Deku.DOM.Attr.WritingMode where

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

data WritingMode = WritingMode

instance Attr FeBlend_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeColorMatrix_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeComponentTransfer_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeComposite_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeConvolveMatrix_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeDiffuseLighting_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeDisplacementMap_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeFlood_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeGaussianBlur_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeImage_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeMerge_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeMorphology_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeOffset_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeSpecularLighting_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeTile_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr FeTurbulence_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr Filter_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr Image_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr Switch_ WritingMode String where
  attr WritingMode value = unsafeAttribute
    { key: "writing-mode", value: prop' value }

instance Attr everything WritingMode Unit where
  attr WritingMode _ = unsafeAttribute
    { key: "writing-mode", value: unset' }
