module Deku.DOM.Attr.AriaRoledescription where

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

data AriaRoledescription = AriaRoledescription

instance Attr Circle_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Circle_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Circle_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Circle_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Circle_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Ellipse_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Ellipse_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Ellipse_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Ellipse_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Ellipse_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr ForeignObject_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr ForeignObject_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr ForeignObject_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr ForeignObject_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr ForeignObject_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr G_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr G_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr G_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr G_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr G_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Line_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Line_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Line_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Line_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Line_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Marker_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Marker_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Marker_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Marker_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Marker_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Path_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Path_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Path_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Path_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Path_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Polygon_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Polygon_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Polygon_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Polygon_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Polygon_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Polyline_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Polyline_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Polyline_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Polyline_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Polyline_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Rect_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Rect_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Rect_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Rect_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Rect_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Svg_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Svg_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Svg_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Svg_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Svg_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Symbol_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Symbol_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Symbol_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Symbol_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Symbol_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Text_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Text_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Text_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Text_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Text_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr TextPath_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr TextPath_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr TextPath_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr TextPath_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr TextPath_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Tspan_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Tspan_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Tspan_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Tspan_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Tspan_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Use_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Use_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr Use_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr Use_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr Use_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr View_ AriaRoledescription (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr View_ AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-roledescription", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-roledescription", value: prop' value }
    )
instance Attr View_ AriaRoledescription  String  where
  attr AriaRoledescription value = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: prop' value }
instance Attr View_ AriaRoledescription (Event.Event  String ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr View_ AriaRoledescription (ST.ST Global.Global  String ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "aria-roledescription", value: prop' value }

instance Attr everything AriaRoledescription (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaRoledescription bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-roledescription", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-roledescription", value: unset' })
instance Attr everything AriaRoledescription (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaRoledescription (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-roledescription", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-roledescription", value: unset' })
instance Attr everything AriaRoledescription  Unit  where
  attr AriaRoledescription _ = unsafeAttribute $ This $ pure $
    { key: "aria-roledescription", value: unset' }
instance Attr everything AriaRoledescription (Event.Event  Unit ) where
  attr AriaRoledescription eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "aria-roledescription", value: unset' }

instance Attr everything AriaRoledescription (ST.ST Global.Global  Unit ) where
  attr AriaRoledescription stValue = unsafeAttribute $ This $
    stValue <#> \_ -> { key: "aria-roledescription", value: unset' }
