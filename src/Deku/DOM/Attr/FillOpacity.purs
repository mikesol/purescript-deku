module Deku.DOM.Attr.FillOpacity where

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

data FillOpacity = FillOpacity

instance Attr Circle_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Circle_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Circle_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Circle_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Circle_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr ClipPath_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr ClipPath_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr ClipPath_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr ClipPath_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr ClipPath_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Defs_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Defs_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Defs_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Defs_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Defs_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Ellipse_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Ellipse_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Ellipse_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Ellipse_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Ellipse_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeBlend_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeBlend_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeBlend_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeBlend_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeBlend_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeColorMatrix_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeColorMatrix_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeColorMatrix_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeColorMatrix_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeColorMatrix_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeComponentTransfer_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeComponentTransfer_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeComponentTransfer_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeComponentTransfer_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeComponentTransfer_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeComposite_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeComposite_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeComposite_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeComposite_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeComposite_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeConvolveMatrix_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeDiffuseLighting_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeDisplacementMap_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeDisplacementMap_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeDisplacementMap_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeDisplacementMap_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeDisplacementMap_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeFlood_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeFlood_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeFlood_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeFlood_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeFlood_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeGaussianBlur_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeGaussianBlur_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeGaussianBlur_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeGaussianBlur_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeGaussianBlur_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeImage_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeImage_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeImage_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeImage_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeImage_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeMerge_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeMerge_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeMerge_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeMerge_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeMerge_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeMorphology_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeMorphology_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeMorphology_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeMorphology_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeMorphology_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeOffset_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeOffset_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeOffset_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeOffset_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeOffset_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeSpecularLighting_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeSpecularLighting_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeSpecularLighting_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeSpecularLighting_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeSpecularLighting_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeTile_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeTile_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeTile_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeTile_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeTile_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeTurbulence_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeTurbulence_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr FeTurbulence_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr FeTurbulence_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr FeTurbulence_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Filter_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Filter_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Filter_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Filter_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Filter_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr ForeignObject_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr ForeignObject_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr ForeignObject_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr ForeignObject_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr ForeignObject_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr G_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr G_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr G_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr G_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr G_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Image_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Image_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Image_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Image_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Image_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Line_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Line_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Line_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Line_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Line_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr LinearGradient_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr LinearGradient_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr LinearGradient_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr LinearGradient_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr LinearGradient_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Marker_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Marker_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Marker_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Marker_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Marker_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Mask_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Mask_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Mask_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Mask_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Mask_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Path_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Path_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Path_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Path_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Path_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Pattern_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Pattern_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Pattern_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Pattern_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Pattern_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Polygon_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Polygon_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Polygon_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Polygon_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Polygon_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Polyline_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Polyline_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Polyline_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Polyline_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Polyline_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr RadialGradient_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr RadialGradient_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr RadialGradient_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr RadialGradient_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr RadialGradient_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Rect_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Rect_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Rect_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Rect_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Rect_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Svg_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Svg_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Svg_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Svg_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Svg_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Switch_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Switch_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Switch_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Switch_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Switch_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Symbol_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Symbol_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Symbol_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Symbol_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Symbol_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Text_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Text_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Text_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Text_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Text_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr TextPath_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr TextPath_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr TextPath_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr TextPath_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr TextPath_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Tspan_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Tspan_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Tspan_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Tspan_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Tspan_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Use_ FillOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Use_ FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fill-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-opacity", value: prop' value })
instance Attr Use_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: prop' value }
instance Attr Use_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr Use_ FillOpacity (ST.ST Global.Global  String ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "fill-opacity", value: prop' value }

instance Attr everything FillOpacity (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FillOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-opacity", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "fill-opacity", value: unset' })
instance Attr everything FillOpacity (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr FillOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "fill-opacity", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "fill-opacity", value: unset' })
instance Attr everything FillOpacity  Unit  where
  attr FillOpacity _ = unsafeAttribute $ This $ pure $
    { key: "fill-opacity", value: unset' }
instance Attr everything FillOpacity (Event.Event  Unit ) where
  attr FillOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "fill-opacity", value: unset' }

instance Attr everything FillOpacity (ST.ST Global.Global  Unit ) where
  attr FillOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "fill-opacity", value: unset' }
