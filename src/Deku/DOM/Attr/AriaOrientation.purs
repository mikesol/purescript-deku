module Deku.DOM.Attr.AriaOrientation where

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

data AriaOrientation = AriaOrientation

instance Attr Circle_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Circle_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Circle_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Circle_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Circle_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Ellipse_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Ellipse_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Ellipse_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Ellipse_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Ellipse_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr ForeignObject_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr ForeignObject_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr ForeignObject_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr ForeignObject_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr ForeignObject_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr G_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr G_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr G_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr G_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr G_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Line_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Line_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Line_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Line_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Line_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Marker_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Marker_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Marker_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Marker_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Marker_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Path_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Path_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Path_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Path_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Path_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Polygon_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Polygon_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Polygon_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Polygon_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Polygon_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Polyline_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Polyline_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Polyline_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Polyline_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Polyline_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Rect_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Rect_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Rect_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Rect_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Rect_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Svg_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Svg_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Svg_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Svg_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Svg_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Symbol_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Symbol_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Symbol_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Symbol_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Symbol_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Text_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Text_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Text_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Text_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Text_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr TextPath_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr TextPath_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr TextPath_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr TextPath_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr TextPath_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Tspan_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Tspan_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Tspan_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Tspan_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Tspan_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Use_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Use_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr Use_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr Use_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr Use_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr View_ AriaOrientation (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr View_ AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-orientation", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-orientation", value: prop' value }
    )
instance Attr View_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: prop' value }
instance Attr View_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr View_ AriaOrientation (ST.ST Global.Global  String ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-orientation", value: prop' value }

instance Attr everything AriaOrientation (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaOrientation bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-orientation", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-orientation", value: unset' })
instance Attr everything AriaOrientation (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaOrientation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-orientation", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-orientation", value: unset' })
instance Attr everything AriaOrientation  Unit  where
  attr AriaOrientation _ = unsafeAttribute $ This $ pure $
    { key: "aria-orientation", value: unset' }
instance Attr everything AriaOrientation (Event.Event  Unit ) where
  attr AriaOrientation eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-orientation", value: unset' }

instance Attr everything AriaOrientation (ST.ST Global.Global  Unit ) where
  attr AriaOrientation stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "aria-orientation", value: unset' }
