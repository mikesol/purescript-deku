module Deku.DOM.Attr.AriaModal where

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

data AriaModal = AriaModal

instance Attr Circle_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Circle_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Circle_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Circle_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Circle_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Ellipse_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Ellipse_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Ellipse_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Ellipse_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Ellipse_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr ForeignObject_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr ForeignObject_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr ForeignObject_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr ForeignObject_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr ForeignObject_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr G_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr G_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr G_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr G_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr G_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Line_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Line_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Line_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Line_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Line_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Marker_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Marker_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Marker_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Marker_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Marker_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Path_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Path_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Path_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Path_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Path_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Polygon_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Polygon_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Polygon_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Polygon_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Polygon_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Polyline_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Polyline_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Polyline_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Polyline_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Polyline_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Rect_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Rect_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Rect_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Rect_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Rect_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Svg_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Svg_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Svg_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Svg_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Svg_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Symbol_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Symbol_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Symbol_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Symbol_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Symbol_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Text_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Text_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Text_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Text_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Text_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr TextPath_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr TextPath_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr TextPath_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr TextPath_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr TextPath_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Tspan_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Tspan_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Tspan_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Tspan_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Tspan_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Use_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Use_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr Use_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr Use_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr Use_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr View_ AriaModal (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr View_ AriaModal (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-modal", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-modal", value: prop' value })
instance Attr View_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: prop' value }
instance Attr View_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr View_ AriaModal (ST.ST Global.Global  String ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-modal", value: prop' value }

instance Attr everything AriaModal (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaModal bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-modal", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-modal", value: unset' })
instance Attr everything AriaModal (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaModal (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-modal", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-modal", value: unset' })
instance Attr everything AriaModal  Unit  where
  attr AriaModal _ = unsafeAttribute $ This $ pure $
    { key: "aria-modal", value: unset' }
instance Attr everything AriaModal (Event.Event  Unit ) where
  attr AriaModal eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-modal", value: unset' }

instance Attr everything AriaModal (ST.ST Global.Global  Unit ) where
  attr AriaModal stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "aria-modal", value: unset' }
