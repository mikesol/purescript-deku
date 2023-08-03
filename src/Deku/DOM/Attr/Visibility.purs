module Deku.DOM.Attr.Visibility where

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
import Deku.DOM.Elt.Stop (Stop_)
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

data Visibility = Visibility

instance Attr Circle_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Circle_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Circle_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Circle_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Circle_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr ClipPath_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr ClipPath_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr ClipPath_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr ClipPath_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr ClipPath_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Defs_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Defs_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Defs_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Defs_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Defs_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Ellipse_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Ellipse_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Ellipse_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Ellipse_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Ellipse_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeBlend_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeBlend_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeBlend_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeBlend_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeBlend_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeColorMatrix_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeColorMatrix_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeColorMatrix_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeColorMatrix_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeColorMatrix_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeComponentTransfer_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeComponentTransfer_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeComponentTransfer_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeComponentTransfer_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeComponentTransfer_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeComposite_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeComposite_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeComposite_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeComposite_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeComposite_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeConvolveMatrix_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeConvolveMatrix_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeConvolveMatrix_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeConvolveMatrix_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeConvolveMatrix_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeDiffuseLighting_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeDiffuseLighting_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeDiffuseLighting_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeDiffuseLighting_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeDiffuseLighting_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeDisplacementMap_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeDisplacementMap_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeDisplacementMap_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeDisplacementMap_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeDisplacementMap_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeFlood_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeFlood_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeFlood_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeFlood_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeFlood_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeGaussianBlur_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeGaussianBlur_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeGaussianBlur_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeGaussianBlur_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeGaussianBlur_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeImage_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeImage_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeImage_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeImage_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeImage_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeMerge_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeMerge_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeMerge_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeMerge_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeMerge_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeMorphology_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeMorphology_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeMorphology_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeMorphology_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeMorphology_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeOffset_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeOffset_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeOffset_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeOffset_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeOffset_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeSpecularLighting_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeSpecularLighting_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeSpecularLighting_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeSpecularLighting_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeSpecularLighting_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeTile_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeTile_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeTile_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeTile_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeTile_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeTurbulence_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeTurbulence_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr FeTurbulence_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr FeTurbulence_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr FeTurbulence_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Filter_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Filter_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Filter_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Filter_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Filter_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr ForeignObject_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr ForeignObject_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr ForeignObject_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr ForeignObject_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr ForeignObject_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr G_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr G_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr G_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr G_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr G_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Image_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Image_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Image_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Image_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Image_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Line_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Line_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Line_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Line_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Line_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr LinearGradient_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr LinearGradient_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr LinearGradient_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr LinearGradient_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr LinearGradient_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Marker_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Marker_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Marker_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Marker_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Marker_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Mask_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Mask_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Mask_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Mask_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Mask_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Path_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Path_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Path_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Path_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Path_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Pattern_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Pattern_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Pattern_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Pattern_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Pattern_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Polygon_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Polygon_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Polygon_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Polygon_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Polygon_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Polyline_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Polyline_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Polyline_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Polyline_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Polyline_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr RadialGradient_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr RadialGradient_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr RadialGradient_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr RadialGradient_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr RadialGradient_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Rect_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Rect_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Rect_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Rect_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Rect_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Stop_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Stop_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Stop_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Stop_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Stop_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Svg_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Svg_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Svg_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Svg_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Svg_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Switch_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Switch_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Switch_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Switch_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Switch_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Symbol_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Symbol_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Symbol_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Symbol_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Symbol_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Text_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Text_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Text_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Text_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Text_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr TextPath_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr TextPath_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr TextPath_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr TextPath_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr TextPath_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Tspan_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Tspan_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Tspan_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Tspan_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Tspan_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Use_ Visibility (NonEmpty.NonEmpty Event.Event  String ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Use_ Visibility (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "visibility", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "visibility", value: prop' value })
instance Attr Use_ Visibility  String  where
  attr Visibility value = unsafeAttribute $ This $ pure $
    { key: "visibility", value: prop' value }
instance Attr Use_ Visibility (Event.Event  String ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr Use_ Visibility (ST.ST Global.Global  String ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "visibility", value: prop' value }

instance Attr everything Visibility (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Visibility bothValues = unsafeAttribute $ Both (pure 
    { key: "visibility", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "visibility", value: unset' })
instance Attr everything Visibility (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Visibility (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "visibility", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "visibility", value: unset' })
instance Attr everything Visibility  Unit  where
  attr Visibility _ = unsafeAttribute $ This $ pure $
    { key: "visibility", value: unset' }
instance Attr everything Visibility (Event.Event  Unit ) where
  attr Visibility eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "visibility", value: unset' }

instance Attr everything Visibility (ST.ST Global.Global  Unit ) where
  attr Visibility stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "visibility", value: unset' }
