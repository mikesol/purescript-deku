module Deku.DOM.Attr.Result where

import Prelude

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

data Result = Result

instance Attr FeBlend_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeColorMatrix_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeComponentTransfer_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeComposite_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeConvolveMatrix_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeDiffuseLighting_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeDisplacementMap_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeDropShadow_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeFlood_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeGaussianBlur_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeImage_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeMerge_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeMorphology_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeOffset_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeSpecularLighting_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeTile_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr FeTurbulence_ Result String where
  attr Result value = unsafeAttribute { key: "result", value: prop' value }

instance Attr everything Result Unit where
  attr Result _ = unsafeAttribute
    { key: "result", value: unset' }
