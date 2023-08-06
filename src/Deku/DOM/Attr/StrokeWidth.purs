module Deku.DOM.Attr.StrokeWidth where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
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

data StrokeWidth = StrokeWidth

instance Attr Circle_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Circle_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Circle_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Circle_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Circle_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr ClipPath_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr ClipPath_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr ClipPath_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr ClipPath_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr ClipPath_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Defs_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Defs_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Defs_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Defs_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Defs_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Ellipse_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Ellipse_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Ellipse_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Ellipse_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Ellipse_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeBlend_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeBlend_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeBlend_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeBlend_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeBlend_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeColorMatrix_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeColorMatrix_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeColorMatrix_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeColorMatrix_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeColorMatrix_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeComponentTransfer_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeComponentTransfer_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeComponentTransfer_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeComponentTransfer_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeComponentTransfer_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeComposite_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeComposite_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeComposite_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeComposite_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeComposite_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeConvolveMatrix_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeConvolveMatrix_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeDiffuseLighting_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeDiffuseLighting_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeDisplacementMap_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeDisplacementMap_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeDisplacementMap_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeDisplacementMap_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeDisplacementMap_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeFlood_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeFlood_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeFlood_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeFlood_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeFlood_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeGaussianBlur_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeGaussianBlur_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeGaussianBlur_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeGaussianBlur_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeGaussianBlur_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeImage_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeImage_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeImage_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeImage_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeImage_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeMerge_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeMerge_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeMerge_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeMerge_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeMerge_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeMorphology_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeMorphology_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeMorphology_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeMorphology_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeMorphology_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeOffset_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeOffset_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeOffset_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeOffset_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeOffset_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeSpecularLighting_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeSpecularLighting_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeSpecularLighting_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeSpecularLighting_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeSpecularLighting_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeTile_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeTile_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeTile_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeTile_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeTile_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeTurbulence_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeTurbulence_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr FeTurbulence_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr FeTurbulence_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr FeTurbulence_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Filter_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Filter_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Filter_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Filter_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Filter_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr ForeignObject_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr ForeignObject_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr ForeignObject_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr ForeignObject_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr ForeignObject_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr G_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr G_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr G_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr G_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr G_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Image_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Image_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Image_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Image_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Image_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Line_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Line_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Line_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Line_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Line_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr LinearGradient_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr LinearGradient_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr LinearGradient_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr LinearGradient_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr LinearGradient_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Marker_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Marker_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Marker_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Marker_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Marker_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Mask_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Mask_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Mask_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Mask_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Mask_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Path_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Path_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Path_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Path_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Path_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Pattern_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Pattern_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Pattern_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Pattern_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Pattern_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Polygon_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Polygon_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Polygon_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Polygon_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Polygon_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Polyline_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Polyline_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Polyline_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Polyline_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Polyline_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr RadialGradient_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr RadialGradient_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr RadialGradient_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr RadialGradient_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr RadialGradient_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Rect_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Rect_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Rect_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Rect_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Rect_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Svg_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Svg_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Svg_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Svg_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Svg_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Switch_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Switch_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Switch_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Switch_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Switch_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Symbol_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Symbol_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Symbol_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Symbol_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Symbol_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Text_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Text_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Text_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Text_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Text_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr TextPath_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr TextPath_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr TextPath_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr TextPath_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr TextPath_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Tspan_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Tspan_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Tspan_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Tspan_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Tspan_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Use_ StrokeWidth (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Use_ StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-width", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-width", value: prop' value })
instance Attr Use_ StrokeWidth  String  where
  attr StrokeWidth value = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: prop' value }
instance Attr Use_ StrokeWidth (Event.Event  String ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-width", value: prop' value }

instance Attr Use_ StrokeWidth (ST.ST Global.Global  String ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-width", value: prop' value }

instance Attr everything StrokeWidth (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StrokeWidth bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-width", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke-width", value: unset' })
instance Attr everything StrokeWidth (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StrokeWidth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "stroke-width", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stroke-width", value: unset' })
instance Attr everything StrokeWidth  Unit  where
  attr StrokeWidth _ = unsafeAttribute $ This $ pure $
    { key: "stroke-width", value: unset' }
instance Attr everything StrokeWidth (Event.Event  Unit ) where
  attr StrokeWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stroke-width", value: unset' }

instance Attr everything StrokeWidth (ST.ST Global.Global  Unit ) where
  attr StrokeWidth iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "stroke-width", value: unset' }
