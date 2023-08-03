module Deku.DOM.Attr.SystemLanguage where

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
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SystemLanguage = SystemLanguage

instance Attr AnimateTransform_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr AnimateTransform_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr AnimateTransform_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr AnimateTransform_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr AnimateTransform_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Circle_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Circle_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Circle_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Circle_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Circle_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr ClipPath_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr ClipPath_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr ClipPath_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr ClipPath_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr ClipPath_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Discard_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Discard_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Discard_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Discard_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Discard_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Ellipse_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Ellipse_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Ellipse_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Ellipse_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Ellipse_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr ForeignObject_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr ForeignObject_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr ForeignObject_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr ForeignObject_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr ForeignObject_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr G_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr G_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr G_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr G_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr G_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Image_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Image_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Image_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Image_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Image_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Line_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Line_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Line_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Line_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Line_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Marker_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Marker_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Marker_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Marker_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Marker_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Mask_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Mask_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Mask_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Mask_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Mask_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Path_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Path_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Path_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Path_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Path_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Pattern_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Pattern_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Pattern_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Pattern_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Pattern_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Polygon_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Polygon_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Polygon_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Polygon_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Polygon_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Polyline_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Polyline_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Polyline_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Polyline_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Polyline_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Rect_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Rect_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Rect_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Rect_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Rect_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Svg_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Svg_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Svg_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Svg_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Svg_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Switch_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Switch_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Switch_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Switch_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Switch_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Text_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Text_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Text_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Text_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Text_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr TextPath_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr TextPath_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr TextPath_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr TextPath_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr TextPath_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Tspan_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Tspan_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Tspan_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Tspan_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Tspan_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Use_ SystemLanguage (NonEmpty.NonEmpty Event.Event  String ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Use_ SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "systemLanguage", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "systemLanguage", value: prop' value })
instance Attr Use_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: prop' value }
instance Attr Use_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr Use_ SystemLanguage (ST.ST Global.Global  String ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "systemLanguage", value: prop' value }

instance Attr everything SystemLanguage (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr SystemLanguage bothValues = unsafeAttribute $ Both (pure 
    { key: "systemLanguage", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "systemLanguage", value: unset' })
instance Attr everything SystemLanguage (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr SystemLanguage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "systemLanguage", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "systemLanguage", value: unset' })
instance Attr everything SystemLanguage  Unit  where
  attr SystemLanguage _ = unsafeAttribute $ This $ pure $
    { key: "systemLanguage", value: unset' }
instance Attr everything SystemLanguage (Event.Event  Unit ) where
  attr SystemLanguage eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "systemLanguage", value: unset' }

instance Attr everything SystemLanguage (ST.ST Global.Global  Unit ) where
  attr SystemLanguage stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "systemLanguage", value: unset' }
