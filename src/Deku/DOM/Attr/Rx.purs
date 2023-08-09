module Deku.DOM.Attr.Rx where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Rx = Rx
instance Attr Ellipse_ Rx  String  where
  attr Rx value = unsafeAttribute (  { key: "rx", value: prop' value  } <$ _)
instance Attr Ellipse_ Rx (Event.Event Unit -> Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute (map (map ( \value ->
    { key: "rx", value: prop' value })) eventValue)
instance Attr Ellipse_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "rx", value: prop' value }
instance Attr Rect_ Rx  String  where
  attr Rx value = unsafeAttribute (  { key: "rx", value: prop' value  } <$ _)
instance Attr Rect_ Rx (Event.Event Unit -> Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute (map (map ( \value ->
    { key: "rx", value: prop' value })) eventValue)
instance Attr Rect_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "rx", value: prop' value }
instance Attr everything Rx  Unit  where
  attr Rx _ = unsafeAttribute (  { key: "rx", value: unset'  } <$ _)
instance Attr everything Rx (Event.Event Unit -> Event.Event  Unit ) where
  attr Rx eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "rx", value: unset' })) eventValue)
instance Attr everything Rx (Event.Event  Unit ) where
  attr Rx eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "rx", value: unset' }