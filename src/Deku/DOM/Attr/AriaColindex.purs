module Deku.DOM.Attr.AriaColindex where

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

data AriaColindex = AriaColindex

instance Attr Circle_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Circle_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Circle_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Circle_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Circle_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Ellipse_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Ellipse_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Ellipse_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Ellipse_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Ellipse_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr ForeignObject_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr ForeignObject_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr ForeignObject_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr ForeignObject_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr ForeignObject_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr G_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr G_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr G_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr G_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr G_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Line_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Line_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Line_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Line_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Line_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Marker_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Marker_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Marker_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Marker_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Marker_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Path_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Path_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Path_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Path_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Path_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Polygon_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Polygon_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Polygon_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Polygon_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Polygon_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Polyline_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Polyline_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Polyline_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Polyline_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Polyline_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Rect_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Rect_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Rect_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Rect_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Rect_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Svg_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Svg_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Svg_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Svg_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Svg_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Symbol_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Symbol_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Symbol_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Symbol_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Symbol_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Text_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Text_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Text_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Text_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Text_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr TextPath_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr TextPath_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr TextPath_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr TextPath_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr TextPath_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Tspan_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Tspan_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Tspan_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Tspan_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Tspan_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Use_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Use_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr Use_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr Use_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr Use_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr View_ AriaColindex (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr View_ AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-colindex", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colindex", value: prop' value })
instance Attr View_ AriaColindex  String  where
  attr AriaColindex value = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: prop' value }
instance Attr View_ AriaColindex (Event.Event  String ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr View_ AriaColindex (ST.ST Global.Global  String ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-colindex", value: prop' value }

instance Attr everything AriaColindex (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaColindex bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colindex", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-colindex", value: unset' })
instance Attr everything AriaColindex (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaColindex (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-colindex", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-colindex", value: unset' })
instance Attr everything AriaColindex  Unit  where
  attr AriaColindex _ = unsafeAttribute $ This $ pure $
    { key: "aria-colindex", value: unset' }
instance Attr everything AriaColindex (Event.Event  Unit ) where
  attr AriaColindex eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-colindex", value: unset' }

instance Attr everything AriaColindex (ST.ST Global.Global  Unit ) where
  attr AriaColindex stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "aria-colindex", value: unset' }
