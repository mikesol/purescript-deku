module Deku.DOM.Attr.AriaRelevant where

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

data AriaRelevant = AriaRelevant

instance Attr Circle_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Circle_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Circle_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Circle_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Circle_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Ellipse_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Ellipse_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Ellipse_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Ellipse_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Ellipse_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr ForeignObject_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr ForeignObject_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr ForeignObject_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr ForeignObject_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr ForeignObject_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr G_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr G_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr G_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr G_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr G_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Line_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Line_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Line_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Line_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Line_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Marker_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Marker_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Marker_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Marker_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Marker_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Path_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Path_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Path_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Path_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Path_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Polygon_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Polygon_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Polygon_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Polygon_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Polygon_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Polyline_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Polyline_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Polyline_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Polyline_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Polyline_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Rect_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Rect_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Rect_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Rect_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Rect_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Svg_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Svg_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Svg_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Svg_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Svg_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Symbol_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Symbol_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Symbol_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Symbol_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Symbol_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Text_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Text_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Text_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Text_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Text_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr TextPath_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr TextPath_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr TextPath_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr TextPath_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr TextPath_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Tspan_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Tspan_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Tspan_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Tspan_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Tspan_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Use_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Use_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr Use_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr Use_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr Use_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr View_ AriaRelevant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr View_ AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-relevant", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-relevant", value: prop' value })
instance Attr View_ AriaRelevant  String  where
  attr AriaRelevant value = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: prop' value }
instance Attr View_ AriaRelevant (Event.Event  String ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr View_ AriaRelevant (ST.ST Global.Global  String ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-relevant", value: prop' value }

instance Attr everything AriaRelevant (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaRelevant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-relevant", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-relevant", value: unset' })
instance Attr everything AriaRelevant (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaRelevant (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-relevant", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-relevant", value: unset' })
instance Attr everything AriaRelevant  Unit  where
  attr AriaRelevant _ = unsafeAttribute $ This $ pure $
    { key: "aria-relevant", value: unset' }
instance Attr everything AriaRelevant (Event.Event  Unit ) where
  attr AriaRelevant eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-relevant", value: unset' }

instance Attr everything AriaRelevant (ST.ST Global.Global  Unit ) where
  attr AriaRelevant stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "aria-relevant", value: unset' }
