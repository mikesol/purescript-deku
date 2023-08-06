module Deku.DOM.Attr.AriaColspan where

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

data AriaColspan = AriaColspan

instance Attr Circle_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Circle_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Circle_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Circle_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Circle_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Ellipse_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Ellipse_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Ellipse_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Ellipse_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Ellipse_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr ForeignObject_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr ForeignObject_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr ForeignObject_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr ForeignObject_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr ForeignObject_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr G_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr G_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr G_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr G_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr G_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Line_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Line_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Line_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Line_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Line_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Marker_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Marker_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Marker_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Marker_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Marker_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Path_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Path_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Path_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Path_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Path_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Polygon_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Polygon_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Polygon_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Polygon_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Polygon_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Polyline_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Polyline_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Polyline_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Polyline_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Polyline_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Rect_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Rect_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Rect_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Rect_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Rect_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Svg_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Svg_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Svg_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Svg_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Svg_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Symbol_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Symbol_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Symbol_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Symbol_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Symbol_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Text_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Text_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Text_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Text_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Text_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr TextPath_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr TextPath_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr TextPath_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr TextPath_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr TextPath_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Tspan_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Tspan_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Tspan_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Tspan_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Tspan_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Use_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Use_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr Use_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr Use_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr Use_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr View_ AriaColspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr View_ AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "aria-colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-colspan", value: prop' value })
instance Attr View_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: prop' value }
instance Attr View_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr View_ AriaColspan (ST.ST Global.Global  String ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "aria-colspan", value: prop' value }

instance Attr everything AriaColspan (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaColspan bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-colspan", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-colspan", value: unset' })
instance Attr everything AriaColspan (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaColspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "aria-colspan", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-colspan", value: unset' })
instance Attr everything AriaColspan  Unit  where
  attr AriaColspan _ = unsafeAttribute $ This $ pure $
    { key: "aria-colspan", value: unset' }
instance Attr everything AriaColspan (Event.Event  Unit ) where
  attr AriaColspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "aria-colspan", value: unset' }

instance Attr everything AriaColspan (ST.ST Global.Global  Unit ) where
  attr AriaColspan iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "aria-colspan", value: unset' }
