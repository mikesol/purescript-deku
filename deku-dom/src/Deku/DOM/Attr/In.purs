module Deku.DOM.Attr.In where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
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
import Deku.DOM.Elt.FilterPrimitive (FilterPrimitive_)

data In = In

instance Deku.Attribute.Attr everything In Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "in", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeBlend_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComponentTransfer_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComposite_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeConvolveMatrix_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDiffuseLighting_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDisplacementMap_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDistantLight_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDropShadow_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFlood_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncA_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncB_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncG_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncR_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMerge_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMergeNode_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMorphology_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FePointLight_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTile_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTurbulence_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FilterPrimitive_ In String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop'
