module Deku.DOM.Attr.Display where

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

data Display = Display

instance Attr Circle_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Circle_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Circle_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Circle_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Circle_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr ClipPath_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr ClipPath_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr ClipPath_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr ClipPath_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr ClipPath_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Defs_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Defs_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Defs_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Defs_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Defs_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Ellipse_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Ellipse_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Ellipse_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Ellipse_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Ellipse_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeBlend_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeBlend_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeBlend_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeBlend_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeBlend_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeColorMatrix_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeColorMatrix_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeColorMatrix_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeColorMatrix_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeColorMatrix_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeComponentTransfer_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeComponentTransfer_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeComponentTransfer_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeComponentTransfer_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeComponentTransfer_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeComposite_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeComposite_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeComposite_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeComposite_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeComposite_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeConvolveMatrix_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeConvolveMatrix_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeConvolveMatrix_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeConvolveMatrix_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeConvolveMatrix_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeDiffuseLighting_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeDiffuseLighting_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeDiffuseLighting_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeDiffuseLighting_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeDiffuseLighting_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeDisplacementMap_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeDisplacementMap_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeDisplacementMap_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeDisplacementMap_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeDisplacementMap_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeFlood_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeFlood_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeFlood_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeFlood_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeFlood_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeGaussianBlur_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeGaussianBlur_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeGaussianBlur_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeGaussianBlur_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeGaussianBlur_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeImage_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeImage_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeImage_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeImage_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeImage_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeMerge_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeMerge_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeMerge_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeMerge_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeMerge_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeMorphology_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeMorphology_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeMorphology_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeMorphology_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeMorphology_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeOffset_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeOffset_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeOffset_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeOffset_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeOffset_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeSpecularLighting_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeSpecularLighting_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeSpecularLighting_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeSpecularLighting_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeSpecularLighting_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeTile_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeTile_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeTile_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeTile_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeTile_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr FeTurbulence_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeTurbulence_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr FeTurbulence_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr FeTurbulence_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr FeTurbulence_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Filter_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Filter_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Filter_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Filter_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Filter_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr ForeignObject_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr ForeignObject_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr ForeignObject_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr ForeignObject_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr ForeignObject_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr G_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr G_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr G_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr G_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr G_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Image_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Image_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Image_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Image_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Image_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Line_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Line_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Line_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Line_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Line_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr LinearGradient_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr LinearGradient_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr LinearGradient_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr LinearGradient_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr LinearGradient_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Marker_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Marker_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Marker_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Marker_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Marker_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Mask_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Mask_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Mask_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Mask_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Mask_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Path_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Path_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Path_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Path_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Path_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Pattern_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Pattern_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Pattern_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Pattern_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Pattern_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Polygon_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Polygon_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Polygon_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Polygon_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Polygon_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Polyline_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Polyline_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Polyline_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Polyline_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Polyline_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr RadialGradient_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr RadialGradient_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr RadialGradient_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr RadialGradient_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr RadialGradient_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Rect_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Rect_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Rect_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Rect_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Rect_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Stop_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Stop_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Stop_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Stop_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Stop_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Svg_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Svg_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Svg_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Svg_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Svg_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Switch_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Switch_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Switch_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Switch_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Switch_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Symbol_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Symbol_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Symbol_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Symbol_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Symbol_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Text_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Text_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Text_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Text_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Text_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr TextPath_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr TextPath_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr TextPath_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr TextPath_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr TextPath_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Tspan_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Tspan_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Tspan_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Tspan_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Tspan_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr Use_ Display (NonEmpty.NonEmpty Event.Event  String ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Use_ Display (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "display", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "display", value: prop' value })
instance Attr Use_ Display  String  where
  attr Display value = unsafeAttribute $ This $ pure $
    { key: "display", value: prop' value }
instance Attr Use_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "display", value: prop' value }

instance Attr Use_ Display (ST.ST Global.Global  String ) where
  attr Display iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "display", value: prop' value }

instance Attr everything Display (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Display bothValues = unsafeAttribute $ Both (pure 
    { key: "display", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "display", value: unset' })
instance Attr everything Display (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Display (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "display", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "display", value: unset' })
instance Attr everything Display  Unit  where
  attr Display _ = unsafeAttribute $ This $ { key: "display", value: unset' }
instance Attr everything Display (Event.Event  Unit ) where
  attr Display eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "display", value: unset' }

instance Attr everything Display (ST.ST Global.Global  Unit ) where
  attr Display iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "display", value: unset' }
