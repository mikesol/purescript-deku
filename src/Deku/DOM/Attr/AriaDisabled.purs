module Deku.DOM.Attr.AriaDisabled where

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

data AriaDisabled = AriaDisabled

instance Attr Circle_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Circle_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Circle_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Circle_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Circle_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Ellipse_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Ellipse_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Ellipse_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Ellipse_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Ellipse_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr ForeignObject_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr ForeignObject_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr ForeignObject_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr ForeignObject_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr ForeignObject_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr G_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr G_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr G_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr G_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr G_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Line_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Line_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Line_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Line_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Line_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Marker_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Marker_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Marker_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Marker_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Marker_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Path_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Path_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Path_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Path_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Path_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Polygon_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Polygon_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Polygon_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Polygon_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Polygon_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Polyline_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Polyline_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Polyline_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Polyline_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Polyline_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Rect_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Rect_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Rect_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Rect_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Rect_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Svg_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Svg_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Svg_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Svg_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Svg_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Symbol_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Symbol_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Symbol_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Symbol_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Symbol_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Text_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Text_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Text_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Text_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Text_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr TextPath_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr TextPath_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr TextPath_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr TextPath_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr TextPath_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Tspan_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Tspan_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Tspan_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Tspan_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Tspan_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Use_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Use_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr Use_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr Use_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr Use_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr View_ AriaDisabled (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr View_ AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-disabled", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-disabled", value: prop' value })
instance Attr View_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: prop' value }
instance Attr View_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr View_ AriaDisabled (ST.ST Global.Global  String ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-disabled", value: prop' value }

instance Attr everything AriaDisabled (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaDisabled bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-disabled", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-disabled", value: unset' })
instance Attr everything AriaDisabled (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaDisabled (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-disabled", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-disabled", value: unset' })
instance Attr everything AriaDisabled  Unit  where
  attr AriaDisabled _ = unsafeAttribute $ This $ pure $
    { key: "aria-disabled", value: unset' }
instance Attr everything AriaDisabled (Event.Event  Unit ) where
  attr AriaDisabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-disabled", value: unset' }

instance Attr everything AriaDisabled (ST.ST Global.Global  Unit ) where
  attr AriaDisabled stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "aria-disabled", value: unset' }
