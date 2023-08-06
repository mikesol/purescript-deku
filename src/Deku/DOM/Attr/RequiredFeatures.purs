module Deku.DOM.Attr.RequiredFeatures where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RequiredFeatures = RequiredFeatures

instance Attr AnimateTransform_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr AnimateTransform_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr AnimateTransform_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr AnimateTransform_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr AnimateTransform_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Discard_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Discard_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Discard_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Discard_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Discard_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Ellipse_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Ellipse_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Ellipse_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Ellipse_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Ellipse_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr ForeignObject_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr ForeignObject_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr ForeignObject_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr ForeignObject_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr ForeignObject_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr G_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr G_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr G_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr G_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr G_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Image_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Image_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Image_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Image_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Image_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Line_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Line_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Line_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Line_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Line_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Marker_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Marker_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Marker_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Marker_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Marker_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Mask_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Mask_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Mask_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Mask_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Mask_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Path_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Path_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Path_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Path_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Path_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Pattern_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Pattern_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Pattern_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Pattern_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Pattern_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Polygon_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Polygon_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Polygon_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Polygon_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Polygon_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Polyline_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Polyline_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Polyline_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Polyline_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Polyline_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Rect_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Rect_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Rect_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Rect_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Rect_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Svg_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Svg_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Svg_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Svg_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Svg_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Switch_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Switch_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Switch_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Switch_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Switch_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Text_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Text_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Text_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Text_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Text_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr TextPath_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr TextPath_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr TextPath_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr TextPath_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr TextPath_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Tspan_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Tspan_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Tspan_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Tspan_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Tspan_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Use_ RequiredFeatures (NonEmpty.NonEmpty Event.Event  String ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Use_ RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "requiredFeatures", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "requiredFeatures", value: prop' value }
    )
instance Attr Use_ RequiredFeatures  String  where
  attr RequiredFeatures value = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: prop' value }
instance Attr Use_ RequiredFeatures (Event.Event  String ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr Use_ RequiredFeatures (ST.ST Global.Global  String ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "requiredFeatures", value: prop' value }

instance Attr everything RequiredFeatures (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr RequiredFeatures bothValues = unsafeAttribute $ Both (pure 
    { key: "requiredFeatures", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "requiredFeatures", value: unset' })
instance Attr everything RequiredFeatures (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr RequiredFeatures (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "requiredFeatures", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "requiredFeatures", value: unset' })
instance Attr everything RequiredFeatures  Unit  where
  attr RequiredFeatures _ = unsafeAttribute $ This $ pure $
    { key: "requiredFeatures", value: unset' }
instance Attr everything RequiredFeatures (Event.Event  Unit ) where
  attr RequiredFeatures eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "requiredFeatures", value: unset' }

instance Attr everything RequiredFeatures (ST.ST Global.Global  Unit ) where
  attr RequiredFeatures iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "requiredFeatures", value: unset' }
