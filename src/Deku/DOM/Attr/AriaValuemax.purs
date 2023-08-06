module Deku.DOM.Attr.AriaValuemax where

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

data AriaValuemax = AriaValuemax

instance Attr Circle_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Circle_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Circle_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Circle_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Circle_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Ellipse_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Ellipse_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Ellipse_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Ellipse_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Ellipse_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr ForeignObject_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr ForeignObject_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr ForeignObject_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr ForeignObject_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr ForeignObject_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr G_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr G_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr G_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr G_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr G_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Line_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Line_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Line_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Line_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Line_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Marker_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Marker_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Marker_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Marker_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Marker_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Path_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Path_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Path_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Path_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Path_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Polygon_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Polygon_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Polygon_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Polygon_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Polygon_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Polyline_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Polyline_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Polyline_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Polyline_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Polyline_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Rect_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Rect_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Rect_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Rect_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Rect_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Svg_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Svg_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Svg_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Svg_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Svg_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Symbol_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Symbol_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Symbol_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Symbol_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Symbol_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Text_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Text_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Text_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Text_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Text_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr TextPath_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr TextPath_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr TextPath_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr TextPath_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr TextPath_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Tspan_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Tspan_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Tspan_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Tspan_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Tspan_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Use_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Use_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr Use_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr Use_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr Use_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr View_ AriaValuemax (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr View_ AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-valuemax", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-valuemax", value: prop' value })
instance Attr View_ AriaValuemax  String  where
  attr AriaValuemax value = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: prop' value }
instance Attr View_ AriaValuemax (Event.Event  String ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr View_ AriaValuemax (ST.ST Global.Global  String ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-valuemax", value: prop' value }

instance Attr everything AriaValuemax (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaValuemax bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-valuemax", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-valuemax", value: unset' })
instance Attr everything AriaValuemax (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaValuemax (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-valuemax", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-valuemax", value: unset' })
instance Attr everything AriaValuemax  Unit  where
  attr AriaValuemax _ = unsafeAttribute $ This $ pure $
    { key: "aria-valuemax", value: unset' }
instance Attr everything AriaValuemax (Event.Event  Unit ) where
  attr AriaValuemax eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-valuemax", value: unset' }

instance Attr everything AriaValuemax (ST.ST Global.Global  Unit ) where
  attr AriaValuemax iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "aria-valuemax", value: unset' }
