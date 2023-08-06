module Deku.DOM.Attr.AriaAutocomplete where

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

data AriaAutocomplete = AriaAutocomplete

instance Attr Circle_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Circle_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Circle_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Circle_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Circle_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Ellipse_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Ellipse_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Ellipse_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Ellipse_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Ellipse_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr ForeignObject_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr ForeignObject_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr ForeignObject_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr ForeignObject_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr ForeignObject_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr G_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr G_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr G_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr G_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr G_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Line_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Line_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Line_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Line_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Line_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Marker_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Marker_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Marker_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Marker_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Marker_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Path_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Path_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Path_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Path_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Path_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Polygon_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Polygon_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Polygon_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Polygon_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Polygon_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Polyline_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Polyline_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Polyline_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Polyline_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Polyline_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Rect_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Rect_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Rect_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Rect_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Rect_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Svg_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Svg_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Svg_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Svg_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Svg_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Symbol_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Symbol_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Symbol_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Symbol_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Symbol_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Text_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Text_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Text_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Text_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Text_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr TextPath_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr TextPath_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr TextPath_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr TextPath_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr TextPath_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Tspan_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Tspan_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Tspan_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Tspan_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Tspan_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Use_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Use_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr Use_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr Use_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr Use_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr View_ AriaAutocomplete (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr View_ AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-autocomplete", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-autocomplete", value: prop' value }
    )
instance Attr View_ AriaAutocomplete  String  where
  attr AriaAutocomplete value = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: prop' value }
instance Attr View_ AriaAutocomplete (Event.Event  String ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr View_ AriaAutocomplete (ST.ST Global.Global  String ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "aria-autocomplete", value: prop' value }

instance Attr everything AriaAutocomplete (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaAutocomplete bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-autocomplete", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-autocomplete", value: unset' })
instance Attr everything AriaAutocomplete (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaAutocomplete (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-autocomplete", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-autocomplete", value: unset' })
instance Attr everything AriaAutocomplete  Unit  where
  attr AriaAutocomplete _ = unsafeAttribute $ This $ pure $
    { key: "aria-autocomplete", value: unset' }
instance Attr everything AriaAutocomplete (Event.Event  Unit ) where
  attr AriaAutocomplete eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "aria-autocomplete", value: unset' }

instance Attr everything AriaAutocomplete (ST.ST Global.Global  Unit ) where
  attr AriaAutocomplete iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "aria-autocomplete", value: unset' }
