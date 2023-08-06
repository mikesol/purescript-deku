module Deku.DOM.Attr.FillRule where

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

data FillRule = FillRule

instance Attr Circle_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Circle_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Circle_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Circle_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Circle_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr ClipPath_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr ClipPath_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr ClipPath_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr ClipPath_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr ClipPath_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Defs_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Defs_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Defs_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Defs_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Defs_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Ellipse_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Ellipse_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Ellipse_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Ellipse_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Ellipse_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeBlend_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeBlend_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeBlend_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeBlend_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeBlend_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeColorMatrix_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeColorMatrix_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeColorMatrix_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeColorMatrix_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeColorMatrix_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeComponentTransfer_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeComponentTransfer_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeComponentTransfer_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeComponentTransfer_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeComponentTransfer_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeComposite_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeComposite_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeComposite_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeComposite_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeComposite_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeConvolveMatrix_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeConvolveMatrix_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeConvolveMatrix_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeConvolveMatrix_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeConvolveMatrix_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeDiffuseLighting_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeDiffuseLighting_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeDiffuseLighting_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeDiffuseLighting_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeDiffuseLighting_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeDisplacementMap_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeDisplacementMap_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeDisplacementMap_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeDisplacementMap_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeDisplacementMap_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeFlood_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeFlood_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeFlood_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeFlood_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeFlood_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeGaussianBlur_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeGaussianBlur_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeGaussianBlur_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeGaussianBlur_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeGaussianBlur_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeImage_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeImage_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeImage_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeImage_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeImage_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeMerge_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeMerge_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeMerge_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeMerge_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeMerge_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeMorphology_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeMorphology_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeMorphology_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeMorphology_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeMorphology_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeOffset_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeOffset_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeOffset_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeOffset_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeOffset_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeSpecularLighting_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeSpecularLighting_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeSpecularLighting_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeSpecularLighting_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeSpecularLighting_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeTile_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeTile_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeTile_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeTile_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeTile_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeTurbulence_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeTurbulence_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr FeTurbulence_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr FeTurbulence_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr FeTurbulence_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Filter_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Filter_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Filter_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Filter_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Filter_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr ForeignObject_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr ForeignObject_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr ForeignObject_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr ForeignObject_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr ForeignObject_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr G_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr G_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr G_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr G_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr G_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Image_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Image_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Image_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Image_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Image_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Line_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Line_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Line_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Line_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Line_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr LinearGradient_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr LinearGradient_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr LinearGradient_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr LinearGradient_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr LinearGradient_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Marker_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Marker_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Marker_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Marker_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Marker_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Mask_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Mask_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Mask_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Mask_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Mask_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Path_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Path_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Path_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Path_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Path_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Pattern_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Pattern_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Pattern_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Pattern_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Pattern_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Polygon_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Polygon_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Polygon_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Polygon_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Polygon_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Polyline_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Polyline_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Polyline_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Polyline_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Polyline_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr RadialGradient_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr RadialGradient_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr RadialGradient_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr RadialGradient_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr RadialGradient_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Rect_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Rect_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Rect_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Rect_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Rect_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Svg_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Svg_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Svg_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Svg_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Svg_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Switch_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Switch_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Switch_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Switch_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Switch_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Symbol_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Symbol_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Symbol_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Symbol_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Symbol_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Text_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Text_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Text_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Text_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Text_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr TextPath_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr TextPath_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr TextPath_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr TextPath_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr TextPath_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Tspan_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Tspan_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Tspan_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Tspan_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Tspan_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Use_ FillRule (NonEmpty.NonEmpty Event.Event  String ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Use_ FillRule (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fill-rule", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fill-rule", value: prop' value })
instance Attr Use_ FillRule  String  where
  attr FillRule value = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: prop' value }
instance Attr Use_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }

instance Attr Use_ FillRule (ST.ST Global.Global  String ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "fill-rule", value: prop' value }

instance Attr everything FillRule (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FillRule bothValues = unsafeAttribute $ Both (pure 
    { key: "fill-rule", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "fill-rule", value: unset' })
instance Attr everything FillRule (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr FillRule (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "fill-rule", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "fill-rule", value: unset' })
instance Attr everything FillRule  Unit  where
  attr FillRule _ = unsafeAttribute $ This $ pure $
    { key: "fill-rule", value: unset' }
instance Attr everything FillRule (Event.Event  Unit ) where
  attr FillRule eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fill-rule", value: unset' }

instance Attr everything FillRule (ST.ST Global.Global  Unit ) where
  attr FillRule iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "fill-rule", value: unset' }
