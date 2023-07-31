module Deku.DOM.Attr.Height where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FilterPrimitive (FilterPrimitive_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Video (Video_)

data Height = Height

instance Deku.Attribute.Attr everything Height Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "height", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Canvas_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Embed_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeBlend_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComponentTransfer_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComposite_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeConvolveMatrix_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDiffuseLighting_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDisplacementMap_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDistantLight_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDropShadow_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFlood_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncA_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncB_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncG_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncR_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMerge_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMergeNode_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMorphology_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FePointLight_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTile_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTurbulence_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Filter_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FilterPrimitive_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Pattern_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Source_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Svg_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Table_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tbody_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Td_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tr_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Height String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop'
