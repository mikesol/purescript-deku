module Deku.DOM.Attr.Y where

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

data Y = Y

instance Attr FeBlend_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeBlend_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeBlend_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeColorMatrix_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeColorMatrix_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeColorMatrix_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeComponentTransfer_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeComponentTransfer_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeComponentTransfer_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeComposite_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeComposite_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeComposite_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeConvolveMatrix_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeConvolveMatrix_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeConvolveMatrix_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeDiffuseLighting_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeDiffuseLighting_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeDiffuseLighting_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeDisplacementMap_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeDisplacementMap_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeDisplacementMap_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeDropShadow_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeDropShadow_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeDropShadow_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeFlood_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeFlood_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeFlood_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeGaussianBlur_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeGaussianBlur_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeGaussianBlur_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeImage_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeImage_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeImage_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeMerge_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeMerge_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeMerge_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeMorphology_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeMorphology_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeMorphology_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeOffset_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeOffset_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeOffset_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FePointLight_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FePointLight_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FePointLight_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeSpecularLighting_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeSpecularLighting_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeSpecularLighting_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeSpotLight_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeSpotLight_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeSpotLight_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeTile_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeTile_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeTile_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr FeTurbulence_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr FeTurbulence_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr FeTurbulence_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Filter_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Filter_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Filter_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr ForeignObject_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr ForeignObject_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr ForeignObject_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Image_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Image_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Image_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Mask_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Mask_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Mask_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Pattern_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Pattern_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Pattern_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Rect_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Rect_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Rect_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Svg_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Svg_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Svg_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Symbol_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Symbol_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Symbol_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Text_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Text_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Text_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Tspan_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Tspan_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Tspan_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr Use_ Y (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y bothValues = unsafeAttribute $ Both
    { key: "y", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y", value: prop' value })
instance Attr Use_ Y  String  where
  attr Y value = unsafeAttribute $ This { key: "y", value: prop' value }
instance Attr Use_ Y (Event.Event  String ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y", value: prop' value }

instance Attr everything Y (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Y bothValues = unsafeAttribute $ Both { key: "y", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "y", value: unset' })
instance Attr everything Y  Unit  where
  attr Y _ = unsafeAttribute $ This { key: "y", value: unset' }
instance Attr everything Y (Event.Event  Unit ) where
  attr Y eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "y", value: unset' }
