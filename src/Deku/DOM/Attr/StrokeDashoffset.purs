module Deku.DOM.Attr.StrokeDashoffset where

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

data StrokeDashoffset = StrokeDashoffset

instance Attr Circle_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Circle_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Circle_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Circle_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Circle_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr ClipPath_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr ClipPath_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr ClipPath_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr ClipPath_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr ClipPath_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Defs_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Defs_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Defs_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Defs_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Defs_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Ellipse_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Ellipse_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Ellipse_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Ellipse_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Ellipse_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeBlend_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeBlend_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeBlend_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeBlend_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeBlend_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeColorMatrix_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeColorMatrix_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeColorMatrix_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeColorMatrix_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeColorMatrix_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeComponentTransfer_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeComponentTransfer_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeComponentTransfer_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeComponentTransfer_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeComponentTransfer_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeComposite_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeComposite_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeComposite_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeComposite_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeComposite_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeConvolveMatrix_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeConvolveMatrix_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeDiffuseLighting_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeDiffuseLighting_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeDisplacementMap_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeDisplacementMap_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeDisplacementMap_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeDisplacementMap_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeDisplacementMap_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeFlood_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeFlood_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeFlood_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeFlood_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeFlood_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeGaussianBlur_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeGaussianBlur_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeGaussianBlur_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeGaussianBlur_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeGaussianBlur_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeImage_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeImage_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeImage_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeImage_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeImage_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeMerge_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeMerge_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeMerge_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeMerge_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeMerge_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeMorphology_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeMorphology_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeMorphology_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeMorphology_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeMorphology_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeOffset_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeOffset_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeOffset_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeOffset_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeOffset_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeSpecularLighting_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeSpecularLighting_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeSpecularLighting_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeSpecularLighting_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeSpecularLighting_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeTile_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeTile_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeTile_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeTile_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeTile_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeTurbulence_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeTurbulence_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr FeTurbulence_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeTurbulence_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr FeTurbulence_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Filter_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Filter_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Filter_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Filter_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Filter_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr ForeignObject_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr ForeignObject_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr ForeignObject_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr ForeignObject_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr ForeignObject_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr G_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr G_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr G_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr G_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr G_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Image_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Image_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Image_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Image_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Image_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Line_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Line_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Line_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Line_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Line_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr LinearGradient_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr LinearGradient_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr LinearGradient_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr LinearGradient_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr LinearGradient_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Marker_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Marker_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Marker_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Marker_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Marker_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Mask_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Mask_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Mask_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Mask_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Mask_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Path_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Path_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Path_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Path_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Path_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Pattern_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Pattern_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Pattern_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Pattern_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Pattern_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Polygon_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Polygon_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Polygon_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Polygon_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Polygon_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Polyline_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Polyline_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Polyline_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Polyline_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Polyline_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr RadialGradient_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr RadialGradient_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr RadialGradient_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr RadialGradient_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr RadialGradient_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Rect_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Rect_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Rect_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Rect_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Rect_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Svg_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Svg_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Svg_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Svg_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Svg_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Switch_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Switch_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Switch_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Switch_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Switch_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Symbol_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Symbol_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Symbol_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Symbol_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Symbol_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Text_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Text_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Text_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Text_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Text_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr TextPath_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr TextPath_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr TextPath_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr TextPath_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr TextPath_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Tspan_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Tspan_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Tspan_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Tspan_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Tspan_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Use_ StrokeDashoffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Use_ StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-dashoffset", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "stroke-dashoffset", value: prop' value }
    )
instance Attr Use_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Use_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr Use_ StrokeDashoffset (ST.ST Global.Global  String ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }

instance Attr everything StrokeDashoffset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StrokeDashoffset bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-dashoffset", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke-dashoffset", value: unset' })
instance Attr everything StrokeDashoffset (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StrokeDashoffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "stroke-dashoffset", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stroke-dashoffset", value: unset' })
instance Attr everything StrokeDashoffset  Unit  where
  attr StrokeDashoffset _ = unsafeAttribute $ This $ pure $
    { key: "stroke-dashoffset", value: unset' }
instance Attr everything StrokeDashoffset (Event.Event  Unit ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "stroke-dashoffset", value: unset' }

instance Attr everything StrokeDashoffset (ST.ST Global.Global  Unit ) where
  attr StrokeDashoffset stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "stroke-dashoffset", value: unset' }
