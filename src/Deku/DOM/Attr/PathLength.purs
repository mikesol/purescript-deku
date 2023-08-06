module Deku.DOM.Attr.PathLength where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PathLength = PathLength

instance Attr Circle_ PathLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Circle_ PathLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pathLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Circle_ PathLength  String  where
  attr PathLength value = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: prop' value }
instance Attr Circle_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pathLength", value: prop' value }

instance Attr Circle_ PathLength (ST.ST Global.Global  String ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pathLength", value: prop' value }

instance Attr Ellipse_ PathLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Ellipse_ PathLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pathLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Ellipse_ PathLength  String  where
  attr PathLength value = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: prop' value }
instance Attr Ellipse_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pathLength", value: prop' value }

instance Attr Ellipse_ PathLength (ST.ST Global.Global  String ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pathLength", value: prop' value }

instance Attr Line_ PathLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Line_ PathLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pathLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Line_ PathLength  String  where
  attr PathLength value = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: prop' value }
instance Attr Line_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pathLength", value: prop' value }

instance Attr Line_ PathLength (ST.ST Global.Global  String ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pathLength", value: prop' value }

instance Attr Path_ PathLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Path_ PathLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pathLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Path_ PathLength  String  where
  attr PathLength value = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: prop' value }
instance Attr Path_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pathLength", value: prop' value }

instance Attr Path_ PathLength (ST.ST Global.Global  String ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pathLength", value: prop' value }

instance Attr Polygon_ PathLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Polygon_ PathLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pathLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Polygon_ PathLength  String  where
  attr PathLength value = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: prop' value }
instance Attr Polygon_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pathLength", value: prop' value }

instance Attr Polygon_ PathLength (ST.ST Global.Global  String ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pathLength", value: prop' value }

instance Attr Polyline_ PathLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Polyline_ PathLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pathLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Polyline_ PathLength  String  where
  attr PathLength value = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: prop' value }
instance Attr Polyline_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pathLength", value: prop' value }

instance Attr Polyline_ PathLength (ST.ST Global.Global  String ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pathLength", value: prop' value }

instance Attr Rect_ PathLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Rect_ PathLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pathLength", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pathLength", value: prop' value })
instance Attr Rect_ PathLength  String  where
  attr PathLength value = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: prop' value }
instance Attr Rect_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pathLength", value: prop' value }

instance Attr Rect_ PathLength (ST.ST Global.Global  String ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pathLength", value: prop' value }

instance Attr everything PathLength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PathLength bothValues = unsafeAttribute $ Both (pure 
    { key: "pathLength", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pathLength", value: unset' })
instance Attr everything PathLength (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PathLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "pathLength", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pathLength", value: unset' })
instance Attr everything PathLength  Unit  where
  attr PathLength _ = unsafeAttribute $ This $ pure $
    { key: "pathLength", value: unset' }
instance Attr everything PathLength (Event.Event  Unit ) where
  attr PathLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pathLength", value: unset' }

instance Attr everything PathLength (ST.ST Global.Global  Unit ) where
  attr PathLength iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "pathLength", value: unset' }
