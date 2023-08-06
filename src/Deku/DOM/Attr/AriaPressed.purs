module Deku.DOM.Attr.AriaPressed where

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

data AriaPressed = AriaPressed

instance Attr Circle_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Circle_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Circle_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Circle_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Circle_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Ellipse_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Ellipse_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Ellipse_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Ellipse_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Ellipse_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr ForeignObject_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr ForeignObject_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr ForeignObject_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr ForeignObject_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr ForeignObject_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr G_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr G_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr G_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr G_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr G_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Line_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Line_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Line_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Line_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Line_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Marker_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Marker_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Marker_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Marker_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Marker_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Path_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Path_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Path_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Path_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Path_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polygon_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Polygon_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Polygon_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Polygon_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polygon_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polyline_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Polyline_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Polyline_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Polyline_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Polyline_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Rect_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Rect_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Rect_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Rect_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Rect_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Svg_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Svg_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Svg_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Svg_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Svg_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Symbol_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Symbol_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Symbol_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Symbol_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Symbol_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Text_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Text_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Text_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Text_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Text_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr TextPath_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr TextPath_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr TextPath_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr TextPath_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr TextPath_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Tspan_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Tspan_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Tspan_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Tspan_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Tspan_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Use_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Use_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr Use_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr Use_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr Use_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr View_ AriaPressed (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr View_ AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-pressed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-pressed", value: prop' value })
instance Attr View_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: prop' value }
instance Attr View_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr View_ AriaPressed (ST.ST Global.Global  String ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-pressed", value: prop' value }

instance Attr everything AriaPressed (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaPressed bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-pressed", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-pressed", value: unset' })
instance Attr everything AriaPressed (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaPressed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-pressed", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-pressed", value: unset' })
instance Attr everything AriaPressed  Unit  where
  attr AriaPressed _ = unsafeAttribute $ This $ pure $
    { key: "aria-pressed", value: unset' }
instance Attr everything AriaPressed (Event.Event  Unit ) where
  attr AriaPressed eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-pressed", value: unset' }

instance Attr everything AriaPressed (ST.ST Global.Global  Unit ) where
  attr AriaPressed iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "aria-pressed", value: unset' }
