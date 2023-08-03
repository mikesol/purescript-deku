module Deku.DOM.Attr.StrokeDasharray where

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

data StrokeDasharray = StrokeDasharray

instance Attr Circle_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Circle_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Circle_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr ClipPath_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr ClipPath_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr ClipPath_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Defs_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Defs_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Defs_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Ellipse_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Ellipse_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Ellipse_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeBlend_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeBlend_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeBlend_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeColorMatrix_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeColorMatrix_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeColorMatrix_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeComponentTransfer_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeComponentTransfer_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeComponentTransfer_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeComposite_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeComposite_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeComposite_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeConvolveMatrix_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeDiffuseLighting_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeDisplacementMap_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeDisplacementMap_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeDisplacementMap_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeFlood_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeFlood_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeFlood_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeGaussianBlur_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeGaussianBlur_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeGaussianBlur_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeImage_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeImage_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeImage_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeMerge_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeMerge_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeMerge_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeMorphology_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeMorphology_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeMorphology_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeOffset_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeOffset_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeOffset_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeSpecularLighting_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeSpecularLighting_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeSpecularLighting_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeTile_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeTile_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeTile_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr FeTurbulence_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr FeTurbulence_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr FeTurbulence_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Filter_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Filter_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Filter_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr ForeignObject_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr ForeignObject_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr ForeignObject_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr G_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr G_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr G_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Image_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Image_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Image_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Line_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Line_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Line_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr LinearGradient_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr LinearGradient_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr LinearGradient_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Marker_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Marker_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Marker_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Mask_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Mask_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Mask_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Path_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Path_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Path_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Pattern_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Pattern_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Pattern_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Polygon_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Polygon_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Polygon_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Polyline_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Polyline_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Polyline_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr RadialGradient_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr RadialGradient_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr RadialGradient_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Rect_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Rect_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Rect_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Svg_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Svg_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Svg_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Switch_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Switch_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Switch_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Symbol_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Symbol_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Symbol_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Text_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Text_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Text_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr TextPath_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr TextPath_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr TextPath_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Tspan_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Tspan_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Tspan_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr Use_ StrokeDasharray (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dasharray", value: prop' value }
    )
instance Attr Use_ StrokeDasharray  String  where
  attr StrokeDasharray value = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: prop' value }
instance Attr Use_ StrokeDasharray (Event.Event  String ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dasharray", value: prop' value }

instance Attr everything StrokeDasharray (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StrokeDasharray bothValues = unsafeAttribute $ Both
    { key: "stroke-dasharray", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke-dasharray", value: unset' })
instance Attr everything StrokeDasharray  Unit  where
  attr StrokeDasharray _ = unsafeAttribute $ This $ pure $
    { key: "stroke-dasharray", value: unset' }
instance Attr everything StrokeDasharray (Event.Event  Unit ) where
  attr StrokeDasharray eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "stroke-dasharray", value: unset' }
