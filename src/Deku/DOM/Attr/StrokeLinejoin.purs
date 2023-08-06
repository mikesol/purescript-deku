module Deku.DOM.Attr.StrokeLinejoin where

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

data StrokeLinejoin = StrokeLinejoin

instance Attr Circle_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Circle_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Circle_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Circle_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Circle_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr ClipPath_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr ClipPath_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr ClipPath_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr ClipPath_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr ClipPath_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Defs_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Defs_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Defs_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Defs_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Defs_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Ellipse_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Ellipse_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Ellipse_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Ellipse_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Ellipse_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeBlend_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeBlend_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeBlend_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeBlend_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeBlend_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeColorMatrix_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeColorMatrix_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeColorMatrix_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeColorMatrix_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeColorMatrix_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeComponentTransfer_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeComponentTransfer_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeComponentTransfer_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeComponentTransfer_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeComponentTransfer_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeComposite_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeComposite_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeComposite_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeComposite_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeComposite_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeConvolveMatrix_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeConvolveMatrix_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeDiffuseLighting_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeDiffuseLighting_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeDisplacementMap_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeDisplacementMap_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeDisplacementMap_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeDisplacementMap_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeDisplacementMap_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeFlood_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeFlood_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeFlood_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeFlood_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeFlood_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeGaussianBlur_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeGaussianBlur_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeGaussianBlur_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeGaussianBlur_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeGaussianBlur_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeImage_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeImage_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeImage_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeImage_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeImage_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeMerge_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeMerge_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeMerge_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeMerge_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeMerge_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeMorphology_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeMorphology_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeMorphology_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeMorphology_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeMorphology_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeOffset_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeOffset_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeOffset_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeOffset_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeOffset_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeSpecularLighting_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeSpecularLighting_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeSpecularLighting_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeSpecularLighting_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeSpecularLighting_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeTile_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeTile_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeTile_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeTile_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeTile_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeTurbulence_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeTurbulence_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr FeTurbulence_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr FeTurbulence_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr FeTurbulence_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Filter_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Filter_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Filter_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Filter_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Filter_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr ForeignObject_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr ForeignObject_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr ForeignObject_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr ForeignObject_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr ForeignObject_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr G_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr G_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr G_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr G_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr G_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Image_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Image_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Image_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Image_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Image_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Line_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Line_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Line_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Line_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Line_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr LinearGradient_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr LinearGradient_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr LinearGradient_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr LinearGradient_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr LinearGradient_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Marker_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Marker_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Marker_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Marker_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Marker_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Mask_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Mask_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Mask_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Mask_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Mask_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Path_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Path_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Path_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Path_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Path_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Pattern_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Pattern_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Pattern_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Pattern_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Pattern_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Polygon_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Polygon_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Polygon_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Polygon_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Polygon_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Polyline_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Polyline_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Polyline_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Polyline_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Polyline_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr RadialGradient_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr RadialGradient_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr RadialGradient_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr RadialGradient_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr RadialGradient_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Rect_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Rect_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Rect_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Rect_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Rect_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Svg_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Svg_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Svg_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Svg_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Svg_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Switch_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Switch_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Switch_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Switch_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Switch_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Symbol_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Symbol_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Symbol_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Symbol_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Symbol_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Text_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Text_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Text_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Text_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Text_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr TextPath_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr TextPath_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr TextPath_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr TextPath_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr TextPath_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Tspan_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Tspan_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Tspan_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Tspan_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Tspan_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Use_ StrokeLinejoin (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Use_ StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stroke-linejoin", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-linejoin", value: prop' value }
    )
instance Attr Use_ StrokeLinejoin  String  where
  attr StrokeLinejoin value = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: prop' value }
instance Attr Use_ StrokeLinejoin (Event.Event  String ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr Use_ StrokeLinejoin (ST.ST Global.Global  String ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stroke-linejoin", value: prop' value }

instance Attr everything StrokeLinejoin (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StrokeLinejoin bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-linejoin", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke-linejoin", value: unset' })
instance Attr everything StrokeLinejoin (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StrokeLinejoin (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "stroke-linejoin", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stroke-linejoin", value: unset' })
instance Attr everything StrokeLinejoin  Unit  where
  attr StrokeLinejoin _ = unsafeAttribute $ This $ pure $
    { key: "stroke-linejoin", value: unset' }
instance Attr everything StrokeLinejoin (Event.Event  Unit ) where
  attr StrokeLinejoin eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stroke-linejoin", value: unset' }

instance Attr everything StrokeLinejoin (ST.ST Global.Global  Unit ) where
  attr StrokeLinejoin iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "stroke-linejoin", value: unset' }
