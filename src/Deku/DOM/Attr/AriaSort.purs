module Deku.DOM.Attr.AriaSort where

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

data AriaSort = AriaSort

instance Attr Circle_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Circle_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Circle_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Circle_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Circle_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Ellipse_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Ellipse_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Ellipse_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Ellipse_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Ellipse_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr ForeignObject_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr ForeignObject_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr ForeignObject_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr ForeignObject_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr ForeignObject_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr G_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr G_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr G_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr G_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr G_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Line_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Line_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Line_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Line_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Line_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Marker_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Marker_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Marker_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Marker_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Marker_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Path_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Path_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Path_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Path_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Path_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Polygon_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Polygon_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Polygon_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Polygon_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Polygon_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Polyline_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Polyline_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Polyline_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Polyline_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Polyline_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Rect_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Rect_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Rect_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Rect_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Rect_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Svg_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Svg_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Svg_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Svg_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Svg_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Symbol_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Symbol_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Symbol_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Symbol_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Symbol_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Text_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Text_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Text_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Text_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Text_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr TextPath_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr TextPath_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr TextPath_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr TextPath_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr TextPath_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Tspan_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Tspan_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Tspan_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Tspan_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Tspan_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Use_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Use_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr Use_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr Use_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr Use_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr View_ AriaSort (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr View_ AriaSort (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-sort", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-sort", value: prop' value })
instance Attr View_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: prop' value }
instance Attr View_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr View_ AriaSort (ST.ST Global.Global  String ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-sort", value: prop' value }

instance Attr everything AriaSort (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaSort bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-sort", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-sort", value: unset' })
instance Attr everything AriaSort (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaSort (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-sort", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-sort", value: unset' })
instance Attr everything AriaSort  Unit  where
  attr AriaSort _ = unsafeAttribute $ This $ pure $
    { key: "aria-sort", value: unset' }
instance Attr everything AriaSort (Event.Event  Unit ) where
  attr AriaSort eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "aria-sort", value: unset' }

instance Attr everything AriaSort (ST.ST Global.Global  Unit ) where
  attr AriaSort stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "aria-sort", value: unset' }
