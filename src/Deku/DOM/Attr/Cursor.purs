module Deku.DOM.Attr.Cursor where

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
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cursor = Cursor

instance Attr Circle_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Circle_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Circle_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Defs_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Defs_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Defs_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Ellipse_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Ellipse_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Ellipse_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeBlend_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeBlend_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeBlend_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeColorMatrix_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeColorMatrix_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeColorMatrix_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeComponentTransfer_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeComponentTransfer_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeComponentTransfer_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeComposite_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeComposite_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeComposite_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeConvolveMatrix_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeConvolveMatrix_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeConvolveMatrix_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeDiffuseLighting_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeDiffuseLighting_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeDiffuseLighting_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeDisplacementMap_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeDisplacementMap_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeDisplacementMap_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeFlood_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeFlood_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeFlood_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeGaussianBlur_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeGaussianBlur_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeGaussianBlur_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeImage_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeImage_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeImage_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeMerge_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeMerge_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeMerge_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeMorphology_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeMorphology_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeMorphology_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeOffset_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeOffset_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeOffset_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeSpecularLighting_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeSpecularLighting_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeSpecularLighting_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeTile_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeTile_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeTile_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr FeTurbulence_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr FeTurbulence_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr FeTurbulence_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Filter_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Filter_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Filter_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr ForeignObject_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr ForeignObject_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr ForeignObject_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr G_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr G_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr G_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Image_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Image_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Image_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Line_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Line_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Line_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr LinearGradient_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr LinearGradient_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr LinearGradient_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Marker_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Marker_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Marker_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Path_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Path_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Path_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Pattern_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Pattern_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Pattern_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Polygon_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Polygon_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Polygon_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Polyline_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Polyline_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Polyline_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr RadialGradient_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr RadialGradient_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr RadialGradient_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Rect_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Rect_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Rect_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Svg_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Svg_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Svg_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Switch_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Switch_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Switch_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Symbol_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Symbol_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Symbol_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Text_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Text_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Text_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr TextPath_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr TextPath_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr TextPath_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Tspan_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Tspan_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Tspan_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr Use_ Cursor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cursor", value: prop' value })
instance Attr Use_ Cursor  String  where
  attr Cursor value = unsafeAttribute $ This $ pure $
    { key: "cursor", value: prop' value }
instance Attr Use_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cursor", value: prop' value }

instance Attr everything Cursor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Cursor bothValues = unsafeAttribute $ Both
    { key: "cursor", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "cursor", value: unset' })
instance Attr everything Cursor  Unit  where
  attr Cursor _ = unsafeAttribute $ This $ pure $ { key: "cursor", value: unset' }
instance Attr everything Cursor (Event.Event  Unit ) where
  attr Cursor eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cursor", value: unset' }
