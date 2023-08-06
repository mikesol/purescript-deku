module Deku.DOM.Attr.VectorEffect where

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

data VectorEffect = VectorEffect

instance Attr Circle_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Circle_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Circle_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Circle_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Circle_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr ClipPath_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr ClipPath_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr ClipPath_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr ClipPath_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr ClipPath_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Defs_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Defs_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Defs_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Defs_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Defs_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Ellipse_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Ellipse_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Ellipse_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Ellipse_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Ellipse_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeBlend_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeBlend_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeBlend_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeBlend_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeBlend_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeColorMatrix_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeColorMatrix_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeColorMatrix_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeColorMatrix_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeColorMatrix_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeComponentTransfer_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeComponentTransfer_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeComponentTransfer_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeComponentTransfer_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeComponentTransfer_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeComposite_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeComposite_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeComposite_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeComposite_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeComposite_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeConvolveMatrix_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeConvolveMatrix_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeConvolveMatrix_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeConvolveMatrix_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeConvolveMatrix_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeDiffuseLighting_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeDiffuseLighting_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeDiffuseLighting_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeDiffuseLighting_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeDiffuseLighting_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeDisplacementMap_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeDisplacementMap_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeDisplacementMap_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeDisplacementMap_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeDisplacementMap_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeFlood_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeFlood_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeFlood_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeFlood_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeFlood_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeGaussianBlur_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeGaussianBlur_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeGaussianBlur_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeGaussianBlur_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeGaussianBlur_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeImage_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeImage_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeImage_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeImage_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeImage_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeMerge_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeMerge_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeMerge_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeMerge_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeMerge_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeMorphology_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeMorphology_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeMorphology_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeMorphology_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeMorphology_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeOffset_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeOffset_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeOffset_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeOffset_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeOffset_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeSpecularLighting_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeSpecularLighting_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeSpecularLighting_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeSpecularLighting_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeSpecularLighting_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeTile_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeTile_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeTile_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeTile_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeTile_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeTurbulence_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeTurbulence_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr FeTurbulence_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr FeTurbulence_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr FeTurbulence_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Filter_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Filter_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Filter_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Filter_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Filter_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr ForeignObject_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr ForeignObject_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr ForeignObject_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr ForeignObject_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr ForeignObject_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr G_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr G_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr G_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr G_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr G_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Image_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Image_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Image_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Image_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Image_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Line_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Line_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Line_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Line_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Line_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr LinearGradient_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr LinearGradient_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr LinearGradient_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr LinearGradient_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr LinearGradient_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Marker_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Marker_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Marker_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Marker_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Marker_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Mask_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Mask_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Mask_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Mask_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Mask_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Path_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Path_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Path_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Path_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Path_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Pattern_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Pattern_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Pattern_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Pattern_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Pattern_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Polygon_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Polygon_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Polygon_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Polygon_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Polygon_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Polyline_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Polyline_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Polyline_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Polyline_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Polyline_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr RadialGradient_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr RadialGradient_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr RadialGradient_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr RadialGradient_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr RadialGradient_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Rect_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Rect_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Rect_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Rect_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Rect_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Svg_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Svg_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Svg_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Svg_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Svg_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Switch_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Switch_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Switch_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Switch_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Switch_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Symbol_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Symbol_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Symbol_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Symbol_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Symbol_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Text_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Text_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Text_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Text_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Text_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr TextPath_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr TextPath_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr TextPath_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr TextPath_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr TextPath_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Tspan_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Tspan_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Tspan_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Tspan_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Tspan_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Use_ VectorEffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Use_ VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "vector-effect", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "vector-effect", value: prop' value })
instance Attr Use_ VectorEffect  String  where
  attr VectorEffect value = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: prop' value }
instance Attr Use_ VectorEffect (Event.Event  String ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "vector-effect", value: prop' value }

instance Attr Use_ VectorEffect (ST.ST Global.Global  String ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "vector-effect", value: prop' value }

instance Attr everything VectorEffect (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr VectorEffect bothValues = unsafeAttribute $ Both (pure 
    { key: "vector-effect", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "vector-effect", value: unset' })
instance Attr everything VectorEffect (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr VectorEffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "vector-effect", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "vector-effect", value: unset' })
instance Attr everything VectorEffect  Unit  where
  attr VectorEffect _ = unsafeAttribute $ This $ pure $
    { key: "vector-effect", value: unset' }
instance Attr everything VectorEffect (Event.Event  Unit ) where
  attr VectorEffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "vector-effect", value: unset' }

instance Attr everything VectorEffect (ST.ST Global.Global  Unit ) where
  attr VectorEffect iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "vector-effect", value: unset' }
