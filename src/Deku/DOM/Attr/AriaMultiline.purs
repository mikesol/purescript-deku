module Deku.DOM.Attr.AriaMultiline where

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

data AriaMultiline = AriaMultiline

instance Attr Circle_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Circle_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Circle_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Circle_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Circle_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Ellipse_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Ellipse_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Ellipse_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Ellipse_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Ellipse_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr ForeignObject_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr ForeignObject_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr ForeignObject_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr ForeignObject_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr ForeignObject_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr G_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr G_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr G_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr G_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr G_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Line_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Line_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Line_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Line_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Line_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Marker_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Marker_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Marker_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Marker_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Marker_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Path_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Path_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Path_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Path_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Path_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Polygon_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Polygon_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Polygon_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Polygon_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Polygon_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Polyline_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Polyline_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Polyline_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Polyline_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Polyline_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Rect_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Rect_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Rect_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Rect_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Rect_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Svg_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Svg_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Svg_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Svg_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Svg_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Symbol_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Symbol_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Symbol_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Symbol_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Symbol_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Text_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Text_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Text_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Text_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Text_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr TextPath_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr TextPath_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr TextPath_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr TextPath_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr TextPath_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Tspan_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Tspan_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Tspan_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Tspan_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Tspan_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Use_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Use_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr Use_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr Use_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr Use_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr View_ AriaMultiline (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr View_ AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-multiline", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-multiline", value: prop' value })
instance Attr View_ AriaMultiline  String  where
  attr AriaMultiline value = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: prop' value }
instance Attr View_ AriaMultiline (Event.Event  String ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr View_ AriaMultiline (ST.ST Global.Global  String ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-multiline", value: prop' value }

instance Attr everything AriaMultiline (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaMultiline bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-multiline", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-multiline", value: unset' })
instance Attr everything AriaMultiline (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaMultiline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-multiline", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-multiline", value: unset' })
instance Attr everything AriaMultiline  Unit  where
  attr AriaMultiline _ = unsafeAttribute $ This $ pure $
    { key: "aria-multiline", value: unset' }
instance Attr everything AriaMultiline (Event.Event  Unit ) where
  attr AriaMultiline eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-multiline", value: unset' }

instance Attr everything AriaMultiline (ST.ST Global.Global  Unit ) where
  attr AriaMultiline iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "aria-multiline", value: unset' }
