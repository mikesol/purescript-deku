module Deku.DOM.Attr.AriaSetsize where

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

data AriaSetsize = AriaSetsize

instance Attr Circle_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Circle_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Circle_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Circle_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Circle_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Ellipse_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Ellipse_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Ellipse_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Ellipse_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Ellipse_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr ForeignObject_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr ForeignObject_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr ForeignObject_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr ForeignObject_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr ForeignObject_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr G_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr G_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr G_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr G_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr G_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Line_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Line_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Line_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Line_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Line_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Marker_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Marker_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Marker_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Marker_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Marker_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Path_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Path_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Path_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Path_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Path_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Polygon_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Polygon_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Polygon_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Polygon_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Polygon_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Polyline_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Polyline_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Polyline_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Polyline_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Polyline_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Rect_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Rect_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Rect_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Rect_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Rect_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Svg_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Svg_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Svg_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Svg_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Svg_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Symbol_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Symbol_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Symbol_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Symbol_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Symbol_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Text_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Text_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Text_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Text_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Text_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr TextPath_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr TextPath_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr TextPath_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr TextPath_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr TextPath_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Tspan_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Tspan_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Tspan_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Tspan_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Tspan_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Use_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Use_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr Use_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr Use_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr Use_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr View_ AriaSetsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr View_ AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-setsize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-setsize", value: prop' value })
instance Attr View_ AriaSetsize  String  where
  attr AriaSetsize value = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: prop' value }
instance Attr View_ AriaSetsize (Event.Event  String ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr View_ AriaSetsize (ST.ST Global.Global  String ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-setsize", value: prop' value }

instance Attr everything AriaSetsize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaSetsize bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-setsize", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-setsize", value: unset' })
instance Attr everything AriaSetsize (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaSetsize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-setsize", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-setsize", value: unset' })
instance Attr everything AriaSetsize  Unit  where
  attr AriaSetsize _ = unsafeAttribute $ This $ pure $
    { key: "aria-setsize", value: unset' }
instance Attr everything AriaSetsize (Event.Event  Unit ) where
  attr AriaSetsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-setsize", value: unset' }

instance Attr everything AriaSetsize (ST.ST Global.Global  Unit ) where
  attr AriaSetsize stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "aria-setsize", value: unset' }
