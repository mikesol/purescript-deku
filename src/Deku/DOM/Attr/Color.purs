module Deku.DOM.Attr.Color where

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
import Deku.DOM.Elt.Font (Font_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Color = Color

instance Attr Font_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Font_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Font_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Font_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Font_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Hr_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Hr_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Hr_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Hr_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Hr_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Circle_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Circle_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Circle_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Circle_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Circle_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr ClipPath_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr ClipPath_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr ClipPath_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr ClipPath_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr ClipPath_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Defs_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Defs_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Defs_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Defs_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Defs_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Ellipse_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Ellipse_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Ellipse_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Ellipse_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Ellipse_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeBlend_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeBlend_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeBlend_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeBlend_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeBlend_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeColorMatrix_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeColorMatrix_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeColorMatrix_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeColorMatrix_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeColorMatrix_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeComponentTransfer_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeComponentTransfer_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeComponentTransfer_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeComponentTransfer_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeComponentTransfer_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeComposite_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeComposite_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeComposite_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeComposite_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeComposite_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeConvolveMatrix_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeConvolveMatrix_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeConvolveMatrix_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeConvolveMatrix_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeConvolveMatrix_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeDiffuseLighting_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeDiffuseLighting_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeDiffuseLighting_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeDiffuseLighting_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeDiffuseLighting_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeDisplacementMap_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeDisplacementMap_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeDisplacementMap_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeDisplacementMap_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeDisplacementMap_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeFlood_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeFlood_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeFlood_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeFlood_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeFlood_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeGaussianBlur_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeGaussianBlur_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeGaussianBlur_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeGaussianBlur_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeGaussianBlur_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeImage_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeImage_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeImage_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeImage_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeImage_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeMerge_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeMerge_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeMerge_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeMerge_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeMerge_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeMorphology_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeMorphology_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeMorphology_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeMorphology_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeMorphology_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeOffset_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeOffset_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeOffset_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeOffset_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeOffset_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeSpecularLighting_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeSpecularLighting_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeSpecularLighting_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeSpecularLighting_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeSpecularLighting_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeTile_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeTile_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeTile_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeTile_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeTile_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeTurbulence_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeTurbulence_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr FeTurbulence_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr FeTurbulence_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr FeTurbulence_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Filter_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Filter_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Filter_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Filter_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Filter_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr ForeignObject_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr ForeignObject_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr ForeignObject_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr ForeignObject_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr ForeignObject_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr G_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr G_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr G_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr G_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr G_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Image_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Image_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Image_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Image_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Image_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Line_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Line_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Line_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Line_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Line_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr LinearGradient_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr LinearGradient_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr LinearGradient_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr LinearGradient_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr LinearGradient_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Marker_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Marker_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Marker_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Marker_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Marker_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Mask_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Mask_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Mask_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Mask_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Mask_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Path_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Path_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Path_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Path_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Path_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Pattern_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Pattern_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Pattern_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Pattern_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Pattern_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Polygon_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Polygon_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Polygon_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Polygon_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Polygon_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Polyline_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Polyline_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Polyline_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Polyline_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Polyline_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr RadialGradient_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr RadialGradient_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr RadialGradient_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr RadialGradient_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr RadialGradient_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Rect_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Rect_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Rect_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Rect_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Rect_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Stop_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Stop_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Stop_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Stop_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Stop_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Svg_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Svg_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Svg_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Svg_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Svg_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Switch_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Switch_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Switch_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Switch_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Switch_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Symbol_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Symbol_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Symbol_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Symbol_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Symbol_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Text_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Text_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Text_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Text_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Text_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr TextPath_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr TextPath_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr TextPath_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr TextPath_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr TextPath_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Tspan_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Tspan_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Tspan_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Tspan_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Tspan_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Use_ Color (NonEmpty.NonEmpty Event.Event  String ) where
  attr Color bothValues = unsafeAttribute $ Both (pure 
    { key: "color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Use_ Color (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color", value: prop' value })
instance Attr Use_ Color  String  where
  attr Color value = unsafeAttribute $ This $ pure $
    { key: "color", value: prop' value }
instance Attr Use_ Color (Event.Event  String ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr Use_ Color (ST.ST Global.Global  String ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color", value: prop' value }

instance Attr everything Color (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Color bothValues = unsafeAttribute $ Both (pure  { key: "color", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "color", value: unset' })
instance Attr everything Color (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Color (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "color", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "color", value: unset' })
instance Attr everything Color  Unit  where
  attr Color _ = unsafeAttribute $ This $ pure $ { key: "color", value: unset' }
instance Attr everything Color (Event.Event  Unit ) where
  attr Color eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "color", value: unset' }

instance Attr everything Color (ST.ST Global.Global  Unit ) where
  attr Color stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "color", value: unset' }
