module Deku.DOM.Attr.Clip where

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

data Clip = Clip

instance Attr FeBlend_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeColorMatrix_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeComponentTransfer_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeComposite_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeConvolveMatrix_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeDiffuseLighting_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeDisplacementMap_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeFlood_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeGaussianBlur_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeImage_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeMerge_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeMorphology_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeOffset_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeSpecularLighting_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeTile_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr FeTurbulence_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr Filter_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr Image_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr Switch_ Clip String where
  attr Clip value = unsafeAttribute { key: "clip", value: prop' value }

instance Attr everything Clip Unit where
  attr Clip _ = unsafeAttribute
    { key: "clip", value: unset' }
