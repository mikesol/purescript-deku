module Deku.DOM.Attr.AriaDropeffect where

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

data AriaDropeffect = AriaDropeffect

instance Attr Circle_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Circle_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Circle_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Circle_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Circle_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Ellipse_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Ellipse_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Ellipse_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Ellipse_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Ellipse_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr ForeignObject_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr ForeignObject_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr ForeignObject_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr ForeignObject_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr ForeignObject_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr G_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr G_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr G_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr G_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr G_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Line_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Line_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Line_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Line_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Line_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Marker_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Marker_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Marker_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Marker_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Marker_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Path_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Path_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Path_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Path_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Path_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Polygon_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Polygon_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Polygon_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Polygon_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Polygon_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Polyline_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Polyline_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Polyline_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Polyline_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Polyline_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Rect_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Rect_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Rect_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Rect_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Rect_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Svg_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Svg_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Svg_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Svg_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Svg_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Symbol_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Symbol_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Symbol_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Symbol_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Symbol_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Text_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Text_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Text_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Text_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Text_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr TextPath_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr TextPath_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr TextPath_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr TextPath_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr TextPath_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Tspan_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Tspan_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Tspan_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Tspan_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Tspan_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Use_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Use_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr Use_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr Use_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr Use_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr View_ AriaDropeffect (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr View_ AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-dropeffect", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "aria-dropeffect", value: prop' value }
    )
instance Attr View_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: prop' value }
instance Attr View_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr View_ AriaDropeffect (ST.ST Global.Global  String ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-dropeffect", value: prop' value }

instance Attr everything AriaDropeffect (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaDropeffect bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-dropeffect", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-dropeffect", value: unset' })
instance Attr everything AriaDropeffect (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaDropeffect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-dropeffect", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-dropeffect", value: unset' })
instance Attr everything AriaDropeffect  Unit  where
  attr AriaDropeffect _ = unsafeAttribute $ This $ pure $
    { key: "aria-dropeffect", value: unset' }
instance Attr everything AriaDropeffect (Event.Event  Unit ) where
  attr AriaDropeffect eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-dropeffect", value: unset' }

instance Attr everything AriaDropeffect (ST.ST Global.Global  Unit ) where
  attr AriaDropeffect iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "aria-dropeffect", value: unset' }
