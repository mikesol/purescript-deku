module Deku.DOM.Attr.Filter where

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

data Filter = Filter

instance Attr Circle_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Circle_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Circle_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Circle_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Circle_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr ClipPath_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr ClipPath_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr ClipPath_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr ClipPath_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr ClipPath_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Defs_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Defs_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Defs_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Defs_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Defs_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Ellipse_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Ellipse_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Ellipse_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Ellipse_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Ellipse_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeBlend_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeBlend_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeBlend_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeBlend_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeBlend_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeColorMatrix_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeColorMatrix_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeColorMatrix_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeColorMatrix_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeColorMatrix_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeComponentTransfer_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeComponentTransfer_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeComponentTransfer_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeComponentTransfer_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeComponentTransfer_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeComposite_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeComposite_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeComposite_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeComposite_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeComposite_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeConvolveMatrix_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeConvolveMatrix_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeConvolveMatrix_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeConvolveMatrix_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeConvolveMatrix_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeDiffuseLighting_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeDiffuseLighting_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeDiffuseLighting_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeDiffuseLighting_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeDiffuseLighting_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeDisplacementMap_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeDisplacementMap_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeDisplacementMap_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeDisplacementMap_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeDisplacementMap_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeFlood_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeFlood_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeFlood_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeFlood_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeFlood_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeGaussianBlur_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeGaussianBlur_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeGaussianBlur_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeGaussianBlur_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeGaussianBlur_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeImage_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeImage_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeImage_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeImage_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeImage_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeMerge_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeMerge_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeMerge_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeMerge_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeMerge_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeMorphology_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeMorphology_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeMorphology_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeMorphology_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeMorphology_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeOffset_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeOffset_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeOffset_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeOffset_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeOffset_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeSpecularLighting_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeSpecularLighting_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeSpecularLighting_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeSpecularLighting_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeSpecularLighting_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeTile_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeTile_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeTile_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeTile_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeTile_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeTurbulence_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeTurbulence_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr FeTurbulence_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr FeTurbulence_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr FeTurbulence_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Filter_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Filter_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Filter_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Filter_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Filter_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr ForeignObject_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr ForeignObject_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr ForeignObject_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr ForeignObject_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr ForeignObject_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr G_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr G_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr G_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr G_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr G_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Image_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Image_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Image_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Image_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Image_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Line_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Line_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Line_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Line_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Line_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr LinearGradient_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr LinearGradient_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr LinearGradient_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr LinearGradient_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr LinearGradient_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Marker_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Marker_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Marker_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Marker_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Marker_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Mask_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Mask_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Mask_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Mask_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Mask_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Path_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Path_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Path_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Path_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Path_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Pattern_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Pattern_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Pattern_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Pattern_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Pattern_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Polygon_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Polygon_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Polygon_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Polygon_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Polygon_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Polyline_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Polyline_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Polyline_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Polyline_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Polyline_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr RadialGradient_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr RadialGradient_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr RadialGradient_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr RadialGradient_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr RadialGradient_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Rect_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Rect_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Rect_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Rect_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Rect_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Svg_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Svg_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Svg_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Svg_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Svg_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Switch_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Switch_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Switch_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Switch_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Switch_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Symbol_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Symbol_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Symbol_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Symbol_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Symbol_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Text_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Text_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Text_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Text_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Text_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr TextPath_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr TextPath_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr TextPath_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr TextPath_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr TextPath_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Tspan_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Tspan_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Tspan_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Tspan_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Tspan_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Use_ Filter (NonEmpty.NonEmpty Event.Event  String ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Use_ Filter (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filter", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filter", value: prop' value })
instance Attr Use_ Filter  String  where
  attr Filter value = unsafeAttribute $ This $ pure $
    { key: "filter", value: prop' value }
instance Attr Use_ Filter (Event.Event  String ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr Use_ Filter (ST.ST Global.Global  String ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filter", value: prop' value }

instance Attr everything Filter (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Filter bothValues = unsafeAttribute $ Both (pure 
    { key: "filter", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "filter", value: unset' })
instance Attr everything Filter (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Filter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "filter", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "filter", value: unset' })
instance Attr everything Filter  Unit  where
  attr Filter _ = unsafeAttribute $ This $ pure $ { key: "filter", value: unset' }
instance Attr everything Filter (Event.Event  Unit ) where
  attr Filter eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "filter", value: unset' }

instance Attr everything Filter (ST.ST Global.Global  Unit ) where
  attr Filter stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "filter", value: unset' }
