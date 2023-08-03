module Deku.DOM.Attr.AriaInvalid where

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

data AriaInvalid = AriaInvalid

instance Attr Circle_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Circle_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Circle_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Circle_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Circle_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Ellipse_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Ellipse_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Ellipse_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Ellipse_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Ellipse_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr ForeignObject_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr ForeignObject_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr ForeignObject_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr ForeignObject_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr ForeignObject_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr G_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr G_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr G_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr G_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr G_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Line_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Line_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Line_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Line_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Line_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Marker_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Marker_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Marker_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Marker_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Marker_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Path_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Path_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Path_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Path_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Path_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Polygon_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Polygon_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Polygon_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Polygon_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Polygon_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Polyline_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Polyline_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Polyline_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Polyline_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Polyline_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Rect_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Rect_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Rect_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Rect_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Rect_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Svg_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Svg_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Svg_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Svg_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Svg_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Symbol_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Symbol_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Symbol_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Symbol_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Symbol_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Text_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Text_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Text_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Text_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Text_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr TextPath_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr TextPath_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr TextPath_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr TextPath_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr TextPath_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Tspan_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Tspan_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Tspan_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Tspan_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Tspan_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Use_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Use_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr Use_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr Use_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr Use_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr View_ AriaInvalid (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr View_ AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-invalid", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-invalid", value: prop' value })
instance Attr View_ AriaInvalid  String  where
  attr AriaInvalid value = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: prop' value }
instance Attr View_ AriaInvalid (Event.Event  String ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr View_ AriaInvalid (ST.ST Global.Global  String ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-invalid", value: prop' value }

instance Attr everything AriaInvalid (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-invalid", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-invalid", value: unset' })
instance Attr everything AriaInvalid (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-invalid", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-invalid", value: unset' })
instance Attr everything AriaInvalid  Unit  where
  attr AriaInvalid _ = unsafeAttribute $ This $ pure $
    { key: "aria-invalid", value: unset' }
instance Attr everything AriaInvalid (Event.Event  Unit ) where
  attr AriaInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-invalid", value: unset' }

instance Attr everything AriaInvalid (ST.ST Global.Global  Unit ) where
  attr AriaInvalid stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "aria-invalid", value: unset' }
