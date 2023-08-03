module Deku.DOM.Attr.AriaRowindex where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AriaRowindex = AriaRowindex

instance Attr Circle_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Circle_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Circle_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Circle_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Circle_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Ellipse_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Ellipse_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Ellipse_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Ellipse_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Ellipse_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr ForeignObject_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr ForeignObject_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr ForeignObject_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr ForeignObject_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr ForeignObject_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr G_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr G_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr G_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr G_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr G_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Line_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Line_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Line_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Line_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Line_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Marker_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Marker_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Marker_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Marker_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Marker_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Path_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Path_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Path_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Path_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Path_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Polygon_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Polygon_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Polygon_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Polygon_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Polygon_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Polyline_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Polyline_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Polyline_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Polyline_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Polyline_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Rect_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Rect_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Rect_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Rect_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Rect_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Svg_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Svg_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Svg_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Svg_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Svg_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Symbol_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Symbol_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Symbol_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Symbol_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Symbol_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Text_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Text_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Text_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Text_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Text_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr TextPath_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr TextPath_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr TextPath_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr TextPath_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr TextPath_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Tspan_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Tspan_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Tspan_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Tspan_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Tspan_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Use_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Use_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr Use_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr Use_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr Use_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr View_ AriaRowindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr View_ AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-rowindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowindex", value: prop' value })
instance Attr View_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: prop' value }
instance Attr View_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr View_ AriaRowindex (ST.ST Global.Global  String ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }

instance Attr everything AriaRowindex (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaRowindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowindex", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-rowindex", value: unset' })
instance Attr everything AriaRowindex (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaRowindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-rowindex", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-rowindex", value: unset' })
instance Attr everything AriaRowindex  Unit  where
  attr AriaRowindex _ = unsafeAttribute $ This $ pure $
    { key: "aria-rowindex", value: unset' }
instance Attr everything AriaRowindex (Event.Event  Unit ) where
  attr AriaRowindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-rowindex", value: unset' }

instance Attr everything AriaRowindex (ST.ST Global.Global  Unit ) where
  attr AriaRowindex stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "aria-rowindex", value: unset' }
