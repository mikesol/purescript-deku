module Deku.DOM.Attr.AriaErrormessage where

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

data AriaErrormessage = AriaErrormessage

instance Attr Circle_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Circle_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Circle_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Circle_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Circle_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Ellipse_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Ellipse_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Ellipse_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Ellipse_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Ellipse_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr ForeignObject_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr ForeignObject_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr ForeignObject_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr ForeignObject_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr ForeignObject_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr G_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr G_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr G_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr G_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr G_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Line_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Line_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Line_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Line_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Line_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Marker_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Marker_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Marker_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Marker_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Marker_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Path_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Path_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Path_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Path_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Path_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Polygon_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Polygon_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Polygon_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Polygon_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Polygon_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Polyline_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Polyline_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Polyline_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Polyline_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Polyline_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Rect_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Rect_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Rect_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Rect_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Rect_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Svg_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Svg_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Svg_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Svg_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Svg_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Symbol_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Symbol_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Symbol_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Symbol_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Symbol_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Text_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Text_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Text_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Text_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Text_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr TextPath_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr TextPath_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr TextPath_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr TextPath_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr TextPath_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Tspan_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Tspan_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Tspan_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Tspan_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Tspan_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Use_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Use_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr Use_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr Use_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr Use_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr View_ AriaErrormessage (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr View_ AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-errormessage", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-errormessage", value: prop' value }
    )
instance Attr View_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: prop' value }
instance Attr View_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr View_ AriaErrormessage (ST.ST Global.Global  String ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }

instance Attr everything AriaErrormessage (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaErrormessage bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-errormessage", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-errormessage", value: unset' })
instance Attr everything AriaErrormessage (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaErrormessage (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-errormessage", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-errormessage", value: unset' })
instance Attr everything AriaErrormessage  Unit  where
  attr AriaErrormessage _ = unsafeAttribute $ This $ pure $
    { key: "aria-errormessage", value: unset' }
instance Attr everything AriaErrormessage (Event.Event  Unit ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-errormessage", value: unset' }

instance Attr everything AriaErrormessage (ST.ST Global.Global  Unit ) where
  attr AriaErrormessage iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "aria-errormessage", value: unset' }
