module Deku.DOM.Attr.Mask where

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

data Mask = Mask

instance Attr Circle_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Circle_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Circle_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Circle_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Circle_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr ClipPath_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr ClipPath_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr ClipPath_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr ClipPath_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr ClipPath_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Defs_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Defs_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Defs_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Defs_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Defs_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Ellipse_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Ellipse_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Ellipse_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Ellipse_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Ellipse_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeBlend_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeBlend_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeBlend_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeBlend_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeBlend_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeColorMatrix_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeColorMatrix_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeColorMatrix_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeColorMatrix_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeColorMatrix_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeComponentTransfer_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeComponentTransfer_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeComponentTransfer_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeComponentTransfer_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeComponentTransfer_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeComposite_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeComposite_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeComposite_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeComposite_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeComposite_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeConvolveMatrix_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeConvolveMatrix_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeConvolveMatrix_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeConvolveMatrix_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeConvolveMatrix_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeDiffuseLighting_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeDiffuseLighting_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeDiffuseLighting_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeDiffuseLighting_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeDiffuseLighting_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeDisplacementMap_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeDisplacementMap_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeDisplacementMap_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeDisplacementMap_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeDisplacementMap_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeFlood_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeFlood_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeFlood_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeFlood_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeFlood_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeGaussianBlur_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeGaussianBlur_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeGaussianBlur_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeGaussianBlur_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeGaussianBlur_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeImage_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeImage_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeImage_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeImage_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeImage_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeMerge_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeMerge_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeMerge_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeMerge_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeMerge_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeMorphology_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeMorphology_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeMorphology_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeMorphology_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeMorphology_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeOffset_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeOffset_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeOffset_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeOffset_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeOffset_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeSpecularLighting_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeSpecularLighting_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeSpecularLighting_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeSpecularLighting_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeSpecularLighting_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeTile_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeTile_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeTile_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeTile_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeTile_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeTurbulence_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeTurbulence_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr FeTurbulence_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr FeTurbulence_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr FeTurbulence_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Filter_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Filter_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Filter_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Filter_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Filter_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr ForeignObject_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr ForeignObject_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr ForeignObject_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr ForeignObject_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr ForeignObject_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr G_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr G_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr G_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr G_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr G_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Image_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Image_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Image_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Image_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Image_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Line_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Line_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Line_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Line_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Line_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr LinearGradient_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr LinearGradient_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr LinearGradient_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr LinearGradient_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr LinearGradient_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Marker_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Marker_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Marker_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Marker_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Marker_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Mask_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Mask_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Mask_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Mask_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Mask_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Path_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Path_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Path_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Path_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Path_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Pattern_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Pattern_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Pattern_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Pattern_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Pattern_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Polygon_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Polygon_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Polygon_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Polygon_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Polygon_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Polyline_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Polyline_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Polyline_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Polyline_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Polyline_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr RadialGradient_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr RadialGradient_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr RadialGradient_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr RadialGradient_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr RadialGradient_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Rect_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Rect_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Rect_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Rect_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Rect_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Svg_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Svg_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Svg_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Svg_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Svg_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Switch_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Switch_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Switch_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Switch_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Switch_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Symbol_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Symbol_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Symbol_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Symbol_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Symbol_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Text_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Text_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Text_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Text_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Text_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr TextPath_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr TextPath_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr TextPath_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr TextPath_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr TextPath_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Tspan_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Tspan_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Tspan_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Tspan_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Tspan_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Use_ Mask (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure 
    { key: "mask", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Use_ Mask (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "mask", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mask", value: prop' value })
instance Attr Use_ Mask  String  where
  attr Mask value = unsafeAttribute $ This $ pure $
    { key: "mask", value: prop' value }
instance Attr Use_ Mask (Event.Event  String ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr Use_ Mask (ST.ST Global.Global  String ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "mask", value: prop' value }

instance Attr everything Mask (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Mask bothValues = unsafeAttribute $ Both (pure  { key: "mask", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mask", value: unset' })
instance Attr everything Mask (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Mask (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "mask", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mask", value: unset' })
instance Attr everything Mask  Unit  where
  attr Mask _ = unsafeAttribute $ This $ pure $ { key: "mask", value: unset' }
instance Attr everything Mask (Event.Event  Unit ) where
  attr Mask eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "mask", value: unset' }

instance Attr everything Mask (ST.ST Global.Global  Unit ) where
  attr Mask stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "mask", value: unset' }
