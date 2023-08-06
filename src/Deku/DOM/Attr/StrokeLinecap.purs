module Deku.DOM.Attr.StrokeLinecap where

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

data StrokeLinecap = StrokeLinecap

instance Attr Circle_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Circle_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Circle_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Circle_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Circle_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr ClipPath_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr ClipPath_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr ClipPath_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr ClipPath_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr ClipPath_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Defs_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Defs_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Defs_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Defs_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Defs_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Ellipse_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Ellipse_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Ellipse_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Ellipse_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Ellipse_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeBlend_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeBlend_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeBlend_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeBlend_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeBlend_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeColorMatrix_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeColorMatrix_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeColorMatrix_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeColorMatrix_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeColorMatrix_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeComponentTransfer_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeComponentTransfer_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeComponentTransfer_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeComponentTransfer_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeComponentTransfer_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeComposite_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeComposite_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeComposite_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeComposite_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeComposite_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeConvolveMatrix_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeConvolveMatrix_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeDiffuseLighting_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeDiffuseLighting_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeDisplacementMap_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeDisplacementMap_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeDisplacementMap_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeDisplacementMap_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeDisplacementMap_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeFlood_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeFlood_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeFlood_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeFlood_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeFlood_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeGaussianBlur_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeGaussianBlur_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeGaussianBlur_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeGaussianBlur_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeGaussianBlur_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeImage_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeImage_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeImage_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeImage_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeImage_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeMerge_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeMerge_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeMerge_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeMerge_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeMerge_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeMorphology_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeMorphology_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeMorphology_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeMorphology_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeMorphology_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeOffset_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeOffset_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeOffset_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeOffset_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeOffset_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeSpecularLighting_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeSpecularLighting_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeSpecularLighting_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeSpecularLighting_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeSpecularLighting_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeTile_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeTile_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeTile_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeTile_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeTile_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeTurbulence_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeTurbulence_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr FeTurbulence_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr FeTurbulence_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr FeTurbulence_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Filter_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Filter_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Filter_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Filter_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Filter_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr ForeignObject_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr ForeignObject_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr ForeignObject_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr ForeignObject_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr ForeignObject_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr G_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr G_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr G_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr G_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr G_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Image_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Image_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Image_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Image_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Image_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Line_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Line_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Line_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Line_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Line_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr LinearGradient_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr LinearGradient_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr LinearGradient_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr LinearGradient_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr LinearGradient_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Marker_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Marker_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Marker_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Marker_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Marker_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Mask_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Mask_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Mask_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Mask_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Mask_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Path_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Path_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Path_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Path_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Path_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Pattern_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Pattern_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Pattern_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Pattern_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Pattern_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Polygon_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Polygon_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Polygon_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Polygon_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Polygon_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Polyline_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Polyline_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Polyline_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Polyline_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Polyline_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr RadialGradient_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr RadialGradient_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr RadialGradient_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr RadialGradient_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr RadialGradient_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Rect_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Rect_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Rect_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Rect_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Rect_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Svg_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Svg_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Svg_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Svg_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Svg_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Switch_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Switch_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Switch_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Switch_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Switch_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Symbol_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Symbol_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Symbol_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Symbol_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Symbol_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Text_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Text_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Text_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Text_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Text_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr TextPath_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr TextPath_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr TextPath_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr TextPath_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr TextPath_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Tspan_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Tspan_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Tspan_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Tspan_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Tspan_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Use_ StrokeLinecap (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Use_ StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linecap", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-linecap", value: prop' value })
instance Attr Use_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: prop' value }
instance Attr Use_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr Use_ StrokeLinecap (ST.ST Global.Global  String ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linecap", value: prop' value }

instance Attr everything StrokeLinecap (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StrokeLinecap bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linecap", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke-linecap", value: unset' })
instance Attr everything StrokeLinecap (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StrokeLinecap (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "stroke-linecap", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stroke-linecap", value: unset' })
instance Attr everything StrokeLinecap  Unit  where
  attr StrokeLinecap _ = unsafeAttribute $ This $ pure $
    { key: "stroke-linecap", value: unset' }
instance Attr everything StrokeLinecap (Event.Event  Unit ) where
  attr StrokeLinecap eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stroke-linecap", value: unset' }

instance Attr everything StrokeLinecap (ST.ST Global.Global  Unit ) where
  attr StrokeLinecap iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "stroke-linecap", value: unset' }
