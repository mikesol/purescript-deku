module Deku.DOM.Attr.AriaOwns where

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

data AriaOwns = AriaOwns

instance Attr Circle_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Circle_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Circle_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Circle_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Circle_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Ellipse_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Ellipse_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Ellipse_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Ellipse_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Ellipse_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr ForeignObject_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr ForeignObject_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr ForeignObject_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr ForeignObject_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr ForeignObject_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr G_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr G_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr G_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr G_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr G_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Line_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Line_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Line_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Line_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Line_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Marker_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Marker_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Marker_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Marker_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Marker_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Path_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Path_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Path_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Path_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Path_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Polygon_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Polygon_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Polygon_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Polygon_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Polygon_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Polyline_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Polyline_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Polyline_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Polyline_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Polyline_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Rect_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Rect_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Rect_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Rect_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Rect_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Svg_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Svg_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Svg_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Svg_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Svg_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Symbol_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Symbol_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Symbol_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Symbol_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Symbol_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Text_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Text_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Text_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Text_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Text_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr TextPath_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr TextPath_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr TextPath_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr TextPath_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr TextPath_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Tspan_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Tspan_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Tspan_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Tspan_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Tspan_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Use_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Use_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr Use_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr Use_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr Use_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr View_ AriaOwns (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr View_ AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "aria-owns", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "aria-owns", value: prop' value })
instance Attr View_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: prop' value }
instance Attr View_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr View_ AriaOwns (ST.ST Global.Global  String ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "aria-owns", value: prop' value }

instance Attr everything AriaOwns (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaOwns bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-owns", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-owns", value: unset' })
instance Attr everything AriaOwns (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AriaOwns (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "aria-owns", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "aria-owns", value: unset' })
instance Attr everything AriaOwns  Unit  where
  attr AriaOwns _ = unsafeAttribute $ This $ pure $
    { key: "aria-owns", value: unset' }
instance Attr everything AriaOwns (Event.Event  Unit ) where
  attr AriaOwns eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "aria-owns", value: unset' }

instance Attr everything AriaOwns (ST.ST Global.Global  Unit ) where
  attr AriaOwns stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "aria-owns", value: unset' }
