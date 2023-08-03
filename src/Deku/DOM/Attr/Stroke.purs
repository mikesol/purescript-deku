module Deku.DOM.Attr.Stroke where

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

data Stroke = Stroke

instance Attr Circle_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Circle_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Circle_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr ClipPath_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr ClipPath_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr ClipPath_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Defs_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Defs_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Defs_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Ellipse_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Ellipse_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Ellipse_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeBlend_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeBlend_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeBlend_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeColorMatrix_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeColorMatrix_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeColorMatrix_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeComponentTransfer_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeComponentTransfer_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeComponentTransfer_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeComposite_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeComposite_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeComposite_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeConvolveMatrix_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeConvolveMatrix_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeConvolveMatrix_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeDiffuseLighting_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeDiffuseLighting_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeDiffuseLighting_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeDisplacementMap_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeDisplacementMap_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeDisplacementMap_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeFlood_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeFlood_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeFlood_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeGaussianBlur_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeGaussianBlur_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeGaussianBlur_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeImage_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeImage_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeImage_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeMerge_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeMerge_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeMerge_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeMorphology_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeMorphology_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeMorphology_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeOffset_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeOffset_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeOffset_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeSpecularLighting_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeSpecularLighting_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeSpecularLighting_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeTile_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeTile_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeTile_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr FeTurbulence_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr FeTurbulence_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr FeTurbulence_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Filter_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Filter_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Filter_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr ForeignObject_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr ForeignObject_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr ForeignObject_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr G_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr G_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr G_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Image_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Image_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Image_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Line_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Line_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Line_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr LinearGradient_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr LinearGradient_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr LinearGradient_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Marker_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Marker_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Marker_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Mask_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Mask_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Mask_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Path_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Path_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Path_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Pattern_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Pattern_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Pattern_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Polygon_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Polygon_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Polygon_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Polyline_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Polyline_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Polyline_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr RadialGradient_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr RadialGradient_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr RadialGradient_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Rect_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Rect_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Rect_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Svg_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Svg_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Svg_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Switch_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Switch_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Switch_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Symbol_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Symbol_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Symbol_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Text_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Text_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Text_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr TextPath_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr TextPath_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr TextPath_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Tspan_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Tspan_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Tspan_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr Use_ Stroke (NonEmpty.NonEmpty Event.Event  String ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke", value: prop' value })
instance Attr Use_ Stroke  String  where
  attr Stroke value = unsafeAttribute $ This $ pure $
    { key: "stroke", value: prop' value }
instance Attr Use_ Stroke (Event.Event  String ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke", value: prop' value }

instance Attr everything Stroke (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Stroke bothValues = unsafeAttribute $ Both
    { key: "stroke", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke", value: unset' })
instance Attr everything Stroke  Unit  where
  attr Stroke _ = unsafeAttribute $ This $ pure $ { key: "stroke", value: unset' }
instance Attr everything Stroke (Event.Event  Unit ) where
  attr Stroke eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "stroke", value: unset' }
