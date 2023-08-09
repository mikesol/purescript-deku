module Deku.DOM.Attr.Y1 where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Y1 = Y1
instance Attr Line_ Y1  String  where
  attr Y1 value = unsafeAttribute (  { key: "y1", value: prop' value  } <$ _)
instance Attr Line_ Y1 (Event.Event Unit -> Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y1", value: prop' value })) eventValue)
instance Attr Line_ Y1 (Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y1", value: prop' value }
instance Attr LinearGradient_ Y1  String  where
  attr Y1 value = unsafeAttribute (  { key: "y1", value: prop' value  } <$ _)
instance Attr LinearGradient_ Y1 (Event.Event Unit -> Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y1", value: prop' value })) eventValue)
instance Attr LinearGradient_ Y1 (Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y1", value: prop' value }
instance Attr everything Y1  Unit  where
  attr Y1 _ = unsafeAttribute (  { key: "y1", value: unset'  } <$ _)
instance Attr everything Y1 (Event.Event Unit -> Event.Event  Unit ) where
  attr Y1 eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "y1", value: unset' })) eventValue)
instance Attr everything Y1 (Event.Event  Unit ) where
  attr Y1 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "y1", value: unset' }