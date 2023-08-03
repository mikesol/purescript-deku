module Deku.DOM.Attr.StrokeMiterlimit where

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

data StrokeMiterlimit = StrokeMiterlimit

instance Attr Circle_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Circle_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Circle_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Circle_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Circle_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr ClipPath_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr ClipPath_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr ClipPath_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr ClipPath_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr ClipPath_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Defs_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Defs_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Defs_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Defs_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Defs_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Ellipse_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Ellipse_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Ellipse_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Ellipse_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Ellipse_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeBlend_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeBlend_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeBlend_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeBlend_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeBlend_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeColorMatrix_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeColorMatrix_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeColorMatrix_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeColorMatrix_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeColorMatrix_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeComponentTransfer_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeComponentTransfer_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeComponentTransfer_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeComponentTransfer_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeComponentTransfer_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeComposite_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeComposite_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeComposite_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeComposite_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeComposite_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeConvolveMatrix_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeConvolveMatrix_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeDiffuseLighting_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeDiffuseLighting_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeDisplacementMap_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeDisplacementMap_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeDisplacementMap_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeDisplacementMap_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeDisplacementMap_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeFlood_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeFlood_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeFlood_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeFlood_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeFlood_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeGaussianBlur_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeGaussianBlur_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeGaussianBlur_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeGaussianBlur_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeGaussianBlur_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeImage_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeImage_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeImage_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeImage_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeImage_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeMerge_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeMerge_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeMerge_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeMerge_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeMerge_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeMorphology_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeMorphology_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeMorphology_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeMorphology_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeMorphology_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeOffset_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeOffset_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeOffset_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeOffset_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeOffset_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeSpecularLighting_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeSpecularLighting_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeSpecularLighting_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeSpecularLighting_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeSpecularLighting_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeTile_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeTile_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeTile_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeTile_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeTile_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeTurbulence_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeTurbulence_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr FeTurbulence_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr FeTurbulence_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr FeTurbulence_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Filter_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Filter_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Filter_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Filter_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Filter_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr ForeignObject_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr ForeignObject_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr ForeignObject_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr ForeignObject_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr ForeignObject_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr G_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr G_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr G_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr G_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr G_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Image_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Image_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Image_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Image_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Image_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Line_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Line_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Line_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Line_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Line_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr LinearGradient_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr LinearGradient_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr LinearGradient_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr LinearGradient_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr LinearGradient_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Marker_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Marker_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Marker_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Marker_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Marker_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Mask_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Mask_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Mask_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Mask_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Mask_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Path_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Path_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Path_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Path_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Path_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Pattern_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Pattern_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Pattern_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Pattern_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Pattern_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Polygon_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Polygon_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Polygon_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Polygon_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Polygon_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Polyline_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Polyline_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Polyline_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Polyline_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Polyline_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr RadialGradient_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr RadialGradient_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr RadialGradient_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr RadialGradient_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr RadialGradient_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Rect_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Rect_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Rect_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Rect_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Rect_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Svg_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Svg_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Svg_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Svg_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Svg_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Switch_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Switch_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Switch_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Switch_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Switch_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Symbol_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Symbol_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Symbol_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Symbol_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Symbol_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Text_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Text_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Text_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Text_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Text_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr TextPath_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr TextPath_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr TextPath_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr TextPath_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr TextPath_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Tspan_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Tspan_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Tspan_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Tspan_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Tspan_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Use_ StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Use_ StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-miterlimit", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-miterlimit", value: prop' value }
    )
instance Attr Use_ StrokeMiterlimit  String  where
  attr StrokeMiterlimit value = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: prop' value }
instance Attr Use_ StrokeMiterlimit (Event.Event  String ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr Use_ StrokeMiterlimit (ST.ST Global.Global  String ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-miterlimit", value: prop' value }

instance Attr everything StrokeMiterlimit (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StrokeMiterlimit bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-miterlimit", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke-miterlimit", value: unset' })
instance Attr everything StrokeMiterlimit (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StrokeMiterlimit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "stroke-miterlimit", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stroke-miterlimit", value: unset' })
instance Attr everything StrokeMiterlimit  Unit  where
  attr StrokeMiterlimit _ = unsafeAttribute $ This $ pure $
    { key: "stroke-miterlimit", value: unset' }
instance Attr everything StrokeMiterlimit (Event.Event  Unit ) where
  attr StrokeMiterlimit eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "stroke-miterlimit", value: unset' }

instance Attr everything StrokeMiterlimit (ST.ST Global.Global  Unit ) where
  attr StrokeMiterlimit stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "stroke-miterlimit", value: unset' }
