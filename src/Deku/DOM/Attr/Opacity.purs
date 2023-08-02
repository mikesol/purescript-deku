module Deku.DOM.Attr.Opacity where

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

data Opacity = Opacity

instance Attr Circle_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Circle_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Circle_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr ClipPath_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr ClipPath_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr ClipPath_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Defs_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Defs_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Defs_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Ellipse_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Ellipse_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Ellipse_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeBlend_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeBlend_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeBlend_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeColorMatrix_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeColorMatrix_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeColorMatrix_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeComponentTransfer_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeComponentTransfer_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeComponentTransfer_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeComposite_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeComposite_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeComposite_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeConvolveMatrix_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeConvolveMatrix_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeConvolveMatrix_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeDiffuseLighting_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeDiffuseLighting_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeDiffuseLighting_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeDisplacementMap_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeDisplacementMap_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeDisplacementMap_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeFlood_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeFlood_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeFlood_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeGaussianBlur_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeGaussianBlur_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeGaussianBlur_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeImage_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeImage_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeImage_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeMerge_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeMerge_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeMerge_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeMorphology_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeMorphology_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeMorphology_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeOffset_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeOffset_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeOffset_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeSpecularLighting_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeSpecularLighting_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeSpecularLighting_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeTile_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeTile_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeTile_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr FeTurbulence_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr FeTurbulence_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr FeTurbulence_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Filter_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Filter_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Filter_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr ForeignObject_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr ForeignObject_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr ForeignObject_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr G_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr G_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr G_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Image_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Image_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Image_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Line_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Line_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Line_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr LinearGradient_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr LinearGradient_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr LinearGradient_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Marker_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Marker_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Marker_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Mask_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Mask_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Mask_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Path_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Path_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Path_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Pattern_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Pattern_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Pattern_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Polygon_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Polygon_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Polygon_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Polyline_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Polyline_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Polyline_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr RadialGradient_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr RadialGradient_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr RadialGradient_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Rect_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Rect_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Rect_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Svg_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Svg_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Svg_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Switch_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Switch_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Switch_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Symbol_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Symbol_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Symbol_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Text_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Text_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Text_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr TextPath_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr TextPath_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr TextPath_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Tspan_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Tspan_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Tspan_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr Use_ Opacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "opacity", value: prop' value })
instance Attr Use_ Opacity  String  where
  attr Opacity value = unsafeAttribute $ This
    { key: "opacity", value: prop' value }
instance Attr Use_ Opacity (Event.Event  String ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "opacity", value: prop' value }

instance Attr everything Opacity (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Opacity bothValues = unsafeAttribute $ Both
    { key: "opacity", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "opacity", value: unset' })
instance Attr everything Opacity  Unit  where
  attr Opacity _ = unsafeAttribute $ This { key: "opacity", value: unset' }
instance Attr everything Opacity (Event.Event  Unit ) where
  attr Opacity eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "opacity", value: unset' }