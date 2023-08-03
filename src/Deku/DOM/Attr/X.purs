module Deku.DOM.Attr.X where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
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

data X = X

instance Attr FeBlend_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeBlend_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeBlend_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeColorMatrix_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeColorMatrix_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeColorMatrix_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeComponentTransfer_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeComponentTransfer_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeComponentTransfer_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeComposite_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeComposite_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeComposite_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeConvolveMatrix_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeConvolveMatrix_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeConvolveMatrix_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeDiffuseLighting_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeDiffuseLighting_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeDiffuseLighting_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeDisplacementMap_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeDisplacementMap_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeDisplacementMap_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeDropShadow_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeDropShadow_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeDropShadow_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeFlood_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeFlood_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeFlood_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeGaussianBlur_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeGaussianBlur_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeGaussianBlur_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeImage_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeImage_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeImage_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeMerge_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeMerge_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeMerge_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeMorphology_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeMorphology_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeMorphology_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeOffset_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeOffset_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeOffset_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FePointLight_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FePointLight_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FePointLight_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeSpecularLighting_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeSpecularLighting_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeSpecularLighting_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeSpotLight_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeSpotLight_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeSpotLight_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeTile_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeTile_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeTile_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr FeTurbulence_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr FeTurbulence_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr FeTurbulence_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Filter_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Filter_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Filter_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr ForeignObject_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr ForeignObject_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr ForeignObject_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Image_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Image_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Image_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Mask_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Mask_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Mask_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Pattern_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Pattern_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Pattern_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Rect_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Rect_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Rect_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Svg_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Svg_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Svg_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Symbol_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Symbol_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Symbol_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Text_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Text_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Text_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Tspan_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Tspan_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Tspan_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr Use_ X (NonEmpty.NonEmpty Event.Event  String ) where
  attr X bothValues = unsafeAttribute $ Both
    { key: "x", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x", value: prop' value })
instance Attr Use_ X  String  where
  attr X value = unsafeAttribute $ This $ pure $ { key: "x", value: prop' value }
instance Attr Use_ X (Event.Event  String ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x", value: prop' value }

instance Attr everything X (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr X bothValues = unsafeAttribute $ Both { key: "x", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "x", value: unset' })
instance Attr everything X  Unit  where
  attr X _ = unsafeAttribute $ This $ pure $ { key: "x", value: unset' }
instance Attr everything X (Event.Event  Unit ) where
  attr X eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "x", value: unset' }
