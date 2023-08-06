module Deku.DOM.Attr.AriaRowcount where

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

data AriaRowcount = AriaRowcount

instance Attr Circle_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Circle_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Circle_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Circle_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Circle_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Ellipse_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Ellipse_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Ellipse_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Ellipse_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Ellipse_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr ForeignObject_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr ForeignObject_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr ForeignObject_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr ForeignObject_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr ForeignObject_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr G_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr G_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr G_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr G_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr G_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Line_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Line_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Line_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Line_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Line_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Marker_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Marker_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Marker_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Marker_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Marker_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Path_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Path_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Path_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Path_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Path_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Polygon_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Polygon_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Polygon_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Polygon_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Polygon_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Polyline_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Polyline_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Polyline_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Polyline_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Polyline_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Rect_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Rect_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Rect_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Rect_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Rect_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Svg_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Svg_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Svg_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Svg_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Svg_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Symbol_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Symbol_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Symbol_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Symbol_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Symbol_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Text_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Text_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Text_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Text_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Text_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr TextPath_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr TextPath_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr TextPath_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr TextPath_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr TextPath_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Tspan_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Tspan_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Tspan_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Tspan_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Tspan_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Use_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Use_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr Use_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr Use_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr Use_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr View_ AriaRowcount (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr View_ AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-rowcount", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-rowcount", value: prop' value })
instance Attr View_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: prop' value }
instance Attr View_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr View_ AriaRowcount (ST.ST Global.Global  String ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-rowcount", value: prop' value }

instance Attr everything AriaRowcount (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaRowcount bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-rowcount", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-rowcount", value: unset' })
instance Attr everything AriaRowcount (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaRowcount (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-rowcount", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-rowcount", value: unset' })
instance Attr everything AriaRowcount  Unit  where
  attr AriaRowcount _ = unsafeAttribute $ This $ pure $
    { key: "aria-rowcount", value: unset' }
instance Attr everything AriaRowcount (Event.Event  Unit ) where
  attr AriaRowcount eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-rowcount", value: unset' }

instance Attr everything AriaRowcount (ST.ST Global.Global  Unit ) where
  attr AriaRowcount iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "aria-rowcount", value: unset' }
