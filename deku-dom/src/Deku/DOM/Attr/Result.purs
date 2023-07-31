module Deku.DOM.Attr.Result where

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

data Result = Result

instance Deku.Attribute.Attr everything Result Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "result", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeBlend_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComponentTransfer_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComposite_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeConvolveMatrix_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDiffuseLighting_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDisplacementMap_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDistantLight_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDropShadow_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFlood_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncA_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncB_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncG_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncR_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMerge_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMergeNode_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMorphology_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FePointLight_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTile_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTurbulence_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FilterPrimitive_ Result String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop'
