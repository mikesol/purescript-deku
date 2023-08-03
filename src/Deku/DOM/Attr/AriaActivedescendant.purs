module Deku.DOM.Attr.AriaActivedescendant where

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

data AriaActivedescendant = AriaActivedescendant

instance Attr Circle_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Circle_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Circle_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Ellipse_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Ellipse_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Ellipse_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr ForeignObject_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr ForeignObject_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr ForeignObject_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr G_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr G_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr G_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Line_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Line_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Line_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Marker_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Marker_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Marker_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Path_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Path_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Path_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Polygon_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Polygon_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Polygon_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Polyline_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Polyline_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Polyline_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Rect_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Rect_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Rect_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Svg_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Svg_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Svg_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Symbol_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Symbol_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Symbol_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Text_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Text_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Text_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr TextPath_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr TextPath_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr TextPath_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Tspan_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Tspan_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Tspan_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr Use_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr Use_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr Use_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr View_ AriaActivedescendant (NonEmpty.NonEmpty Event.Event  String ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "aria-activedescendant", value: prop' value }
    )
instance Attr View_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: prop' value }
instance Attr View_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }

instance Attr everything AriaActivedescendant (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AriaActivedescendant bothValues = unsafeAttribute $ Both (pure 
    { key: "aria-activedescendant", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "aria-activedescendant", value: unset' })
instance Attr everything AriaActivedescendant  Unit  where
  attr AriaActivedescendant _ = unsafeAttribute $ This $ pure $
    { key: "aria-activedescendant", value: unset' }
instance Attr everything AriaActivedescendant (Event.Event  Unit ) where
  attr AriaActivedescendant eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "aria-activedescendant", value: unset' }
