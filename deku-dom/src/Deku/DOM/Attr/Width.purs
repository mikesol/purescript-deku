module Deku.DOM.Attr.Width where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Col (Col_)
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
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Pre (Pre_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Video (Video_)

data Width = Width

instance Deku.Attribute.Attr everything Width Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "width", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Canvas_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Col_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Embed_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeBlend_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComponentTransfer_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComposite_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeConvolveMatrix_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDiffuseLighting_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDisplacementMap_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDistantLight_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDropShadow_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFlood_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncA_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncB_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncG_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncR_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMerge_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMergeNode_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMorphology_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FePointLight_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTile_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTurbulence_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Filter_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FilterPrimitive_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Hr_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Iframe_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Img_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Object_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Pattern_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Pre_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Source_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Table_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Td_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Width String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop'
