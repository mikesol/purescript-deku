module Deku.DOM.Attr.Transform where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
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
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Defs (Defs_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Transform = Transform

instance Attr Circle_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Circle_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Circle_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr ClipPath_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr ClipPath_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr ClipPath_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Defs_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Defs_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Defs_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Ellipse_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Ellipse_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Ellipse_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeBlend_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeBlend_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeBlend_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeColorMatrix_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeColorMatrix_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeColorMatrix_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeComponentTransfer_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeComponentTransfer_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeComponentTransfer_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeComposite_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeComposite_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeComposite_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeConvolveMatrix_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeConvolveMatrix_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeConvolveMatrix_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeDiffuseLighting_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeDiffuseLighting_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeDiffuseLighting_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeDisplacementMap_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeDisplacementMap_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeDisplacementMap_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeFlood_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeFlood_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeFlood_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeGaussianBlur_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeGaussianBlur_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeGaussianBlur_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeImage_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeImage_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeImage_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeMerge_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeMerge_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeMerge_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeMorphology_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeMorphology_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeMorphology_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeOffset_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeOffset_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeOffset_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeSpecularLighting_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeSpecularLighting_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeSpecularLighting_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeTile_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeTile_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeTile_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr FeTurbulence_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr FeTurbulence_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr FeTurbulence_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Filter_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Filter_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Filter_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr ForeignObject_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr ForeignObject_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr ForeignObject_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr G_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr G_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr G_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Image_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Image_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Image_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Line_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Line_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Line_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr LinearGradient_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr LinearGradient_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr LinearGradient_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Marker_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Marker_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Marker_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Mask_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Mask_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Mask_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Path_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Path_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Path_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Pattern_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Pattern_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Pattern_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Polygon_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Polygon_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Polygon_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Polyline_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Polyline_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Polyline_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr RadialGradient_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr RadialGradient_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr RadialGradient_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Rect_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Rect_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Rect_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Svg_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Svg_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Svg_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Switch_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Switch_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Switch_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Symbol_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Symbol_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Symbol_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Text_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Text_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Text_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr TextPath_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr TextPath_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr TextPath_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Tspan_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Tspan_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Tspan_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr Use_ Transform (NonEmpty.NonEmpty Event.Event  String ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "transform", value: prop' value })
instance Attr Use_ Transform  String  where
  attr Transform value = unsafeAttribute $ This
    { key: "transform", value: prop' value }
instance Attr Use_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "transform", value: prop' value }

instance Attr everything Transform (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Transform bothValues = unsafeAttribute $ Both
    { key: "transform", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "transform", value: unset' })
instance Attr everything Transform  Unit  where
  attr Transform _ = unsafeAttribute $ This
    { key: "transform", value: unset' }
instance Attr everything Transform (Event.Event  Unit ) where
  attr Transform eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "transform", value: unset' }
