module Deku.DOM.Attr.StrokeOpacity where

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

data StrokeOpacity = StrokeOpacity

instance Attr Circle_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Circle_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Circle_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Circle_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Circle_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr ClipPath_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr ClipPath_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr ClipPath_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr ClipPath_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr ClipPath_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Defs_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Defs_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Defs_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Defs_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Defs_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Ellipse_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Ellipse_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Ellipse_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Ellipse_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Ellipse_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeBlend_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeBlend_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeBlend_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeBlend_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeBlend_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeColorMatrix_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeColorMatrix_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeColorMatrix_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeColorMatrix_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeColorMatrix_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeComponentTransfer_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeComponentTransfer_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeComponentTransfer_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeComponentTransfer_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeComponentTransfer_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeComposite_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeComposite_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeComposite_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeComposite_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeComposite_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeDisplacementMap_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeDisplacementMap_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeDisplacementMap_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeDisplacementMap_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeDisplacementMap_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeFlood_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeFlood_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeFlood_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeFlood_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeFlood_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeGaussianBlur_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeGaussianBlur_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeGaussianBlur_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeGaussianBlur_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeGaussianBlur_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeImage_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeImage_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeImage_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeImage_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeImage_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeMerge_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeMerge_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeMerge_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeMerge_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeMerge_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeMorphology_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeMorphology_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeMorphology_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeMorphology_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeMorphology_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeOffset_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeOffset_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeOffset_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeOffset_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeOffset_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeSpecularLighting_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeSpecularLighting_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeSpecularLighting_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeSpecularLighting_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeSpecularLighting_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeTile_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeTile_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeTile_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeTile_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeTile_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeTurbulence_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeTurbulence_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr FeTurbulence_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr FeTurbulence_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr FeTurbulence_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Filter_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Filter_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Filter_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Filter_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Filter_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr ForeignObject_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr ForeignObject_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr ForeignObject_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr ForeignObject_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr ForeignObject_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr G_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr G_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr G_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr G_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr G_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Image_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Image_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Image_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Image_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Image_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Line_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Line_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Line_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Line_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Line_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr LinearGradient_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr LinearGradient_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr LinearGradient_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr LinearGradient_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr LinearGradient_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Marker_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Marker_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Marker_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Marker_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Marker_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Mask_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Mask_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Mask_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Mask_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Mask_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Path_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Path_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Path_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Path_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Path_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Pattern_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Pattern_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Pattern_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Pattern_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Pattern_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Polygon_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Polygon_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Polygon_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Polygon_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Polygon_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Polyline_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Polyline_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Polyline_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Polyline_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Polyline_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr RadialGradient_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr RadialGradient_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr RadialGradient_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr RadialGradient_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr RadialGradient_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Rect_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Rect_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Rect_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Rect_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Rect_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Svg_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Svg_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Svg_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Svg_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Svg_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Switch_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Switch_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Switch_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Switch_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Switch_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Symbol_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Symbol_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Symbol_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Symbol_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Symbol_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Text_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Text_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Text_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Text_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Text_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr TextPath_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr TextPath_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr TextPath_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr TextPath_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr TextPath_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Tspan_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Tspan_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Tspan_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Tspan_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Tspan_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Use_ StrokeOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Use_ StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "stroke-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stroke-opacity", value: prop' value })
instance Attr Use_ StrokeOpacity  String  where
  attr StrokeOpacity value = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: prop' value }
instance Attr Use_ StrokeOpacity (Event.Event  String ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr Use_ StrokeOpacity (ST.ST Global.Global  String ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "stroke-opacity", value: prop' value }

instance Attr everything StrokeOpacity (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StrokeOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stroke-opacity", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stroke-opacity", value: unset' })
instance Attr everything StrokeOpacity (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StrokeOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "stroke-opacity", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stroke-opacity", value: unset' })
instance Attr everything StrokeOpacity  Unit  where
  attr StrokeOpacity _ = unsafeAttribute $ This $ pure $
    { key: "stroke-opacity", value: unset' }
instance Attr everything StrokeOpacity (Event.Event  Unit ) where
  attr StrokeOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stroke-opacity", value: unset' }

instance Attr everything StrokeOpacity (ST.ST Global.Global  Unit ) where
  attr StrokeOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "stroke-opacity", value: unset' }
