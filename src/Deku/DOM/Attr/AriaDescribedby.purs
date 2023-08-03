module Deku.DOM.Attr.AriaDescribedby where

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

data AriaDescribedby = AriaDescribedby

instance Attr Circle_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Circle_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Circle_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Circle_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Circle_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Ellipse_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Ellipse_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Ellipse_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Ellipse_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Ellipse_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr ForeignObject_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr ForeignObject_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr ForeignObject_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr ForeignObject_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr ForeignObject_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr G_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr G_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr G_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr G_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr G_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Line_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Line_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Line_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Line_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Line_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Marker_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Marker_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Marker_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Marker_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Marker_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Path_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Path_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Path_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Path_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Path_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Polygon_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Polygon_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Polygon_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Polygon_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Polygon_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Polyline_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Polyline_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Polyline_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Polyline_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Polyline_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Rect_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Rect_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Rect_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Rect_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Rect_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Svg_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Svg_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Svg_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Svg_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Svg_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Symbol_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Symbol_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Symbol_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Symbol_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Symbol_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Text_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Text_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Text_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Text_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Text_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr TextPath_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr TextPath_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr TextPath_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr TextPath_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr TextPath_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Tspan_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Tspan_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Tspan_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Tspan_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Tspan_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Use_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Use_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr Use_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr Use_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr Use_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr View_ AriaDescribedby (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr View_ AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-describedby", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-describedby", value: prop' value }
    )
instance Attr View_ AriaDescribedby  String  where
  attr AriaDescribedby value = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: prop' value }
instance Attr View_ AriaDescribedby (Event.Event  String ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr View_ AriaDescribedby (ST.ST Global.Global  String ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "aria-describedby", value: prop' value }

instance Attr everything AriaDescribedby (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaDescribedby bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-describedby", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-describedby", value: unset' })
instance Attr everything AriaDescribedby (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaDescribedby (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-describedby", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-describedby", value: unset' })
instance Attr everything AriaDescribedby  Unit  where
  attr AriaDescribedby _ = unsafeAttribute $ This $ pure $
    { key: "aria-describedby", value: unset' }
instance Attr everything AriaDescribedby (Event.Event  Unit ) where
  attr AriaDescribedby eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-describedby", value: unset' }

instance Attr everything AriaDescribedby (ST.ST Global.Global  Unit ) where
  attr AriaDescribedby stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "aria-describedby", value: unset' }
