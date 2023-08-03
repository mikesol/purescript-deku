module Deku.DOM.Attr.PointerEvents where

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
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointerEvents = PointerEvents

instance Attr Circle_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Circle_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Circle_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Circle_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Circle_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Defs_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Defs_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Defs_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Defs_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Defs_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Ellipse_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Ellipse_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Ellipse_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Ellipse_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Ellipse_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeBlend_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeBlend_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeBlend_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeBlend_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeBlend_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeColorMatrix_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeColorMatrix_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeColorMatrix_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeColorMatrix_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeColorMatrix_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeComponentTransfer_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeComponentTransfer_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeComponentTransfer_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeComponentTransfer_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeComponentTransfer_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeComposite_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeComposite_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeComposite_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeComposite_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeComposite_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeConvolveMatrix_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeConvolveMatrix_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeConvolveMatrix_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeConvolveMatrix_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeConvolveMatrix_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeDiffuseLighting_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeDiffuseLighting_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeDiffuseLighting_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeDiffuseLighting_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeDiffuseLighting_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeDisplacementMap_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeDisplacementMap_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeDisplacementMap_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeDisplacementMap_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeDisplacementMap_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeFlood_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeFlood_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeFlood_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeFlood_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeFlood_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeGaussianBlur_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeGaussianBlur_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeGaussianBlur_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeGaussianBlur_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeGaussianBlur_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeImage_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeImage_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeImage_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeImage_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeImage_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeMerge_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeMerge_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeMerge_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeMerge_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeMerge_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeMorphology_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeMorphology_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeMorphology_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeMorphology_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeMorphology_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeOffset_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeOffset_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeOffset_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeOffset_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeOffset_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeSpecularLighting_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeSpecularLighting_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeSpecularLighting_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeSpecularLighting_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeSpecularLighting_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeTile_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeTile_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeTile_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeTile_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeTile_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeTurbulence_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeTurbulence_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr FeTurbulence_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr FeTurbulence_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr FeTurbulence_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Filter_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Filter_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Filter_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Filter_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Filter_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr ForeignObject_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr ForeignObject_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr ForeignObject_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr ForeignObject_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr ForeignObject_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr G_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr G_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr G_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr G_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr G_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Image_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Image_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Image_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Image_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Image_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Line_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Line_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Line_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Line_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Line_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr LinearGradient_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr LinearGradient_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr LinearGradient_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr LinearGradient_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr LinearGradient_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Marker_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Marker_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Marker_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Marker_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Marker_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Path_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Path_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Path_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Path_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Path_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Pattern_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Pattern_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Pattern_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Pattern_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Pattern_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Polygon_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Polygon_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Polygon_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Polygon_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Polygon_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Polyline_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Polyline_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Polyline_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Polyline_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Polyline_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr RadialGradient_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr RadialGradient_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr RadialGradient_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr RadialGradient_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr RadialGradient_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Rect_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Rect_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Rect_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Rect_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Rect_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Svg_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Svg_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Svg_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Svg_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Svg_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Switch_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Switch_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Switch_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Switch_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Switch_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Symbol_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Symbol_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Symbol_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Symbol_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Symbol_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Text_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Text_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Text_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Text_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Text_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr TextPath_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr TextPath_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr TextPath_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr TextPath_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr TextPath_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Tspan_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Tspan_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Tspan_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Tspan_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Tspan_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Use_ PointerEvents (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Use_ PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointer-events", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointer-events", value: prop' value })
instance Attr Use_ PointerEvents  String  where
  attr PointerEvents value = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: prop' value }
instance Attr Use_ PointerEvents (Event.Event  String ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr Use_ PointerEvents (ST.ST Global.Global  String ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointer-events", value: prop' value }

instance Attr everything PointerEvents (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PointerEvents bothValues = unsafeAttribute $ Both (pure 
    { key: "pointer-events", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointer-events", value: unset' })
instance Attr everything PointerEvents (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PointerEvents (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "pointer-events", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointer-events", value: unset' })
instance Attr everything PointerEvents  Unit  where
  attr PointerEvents _ = unsafeAttribute $ This $ pure $
    { key: "pointer-events", value: unset' }
instance Attr everything PointerEvents (Event.Event  Unit ) where
  attr PointerEvents eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointer-events", value: unset' }

instance Attr everything PointerEvents (ST.ST Global.Global  Unit ) where
  attr PointerEvents stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "pointer-events", value: unset' }
