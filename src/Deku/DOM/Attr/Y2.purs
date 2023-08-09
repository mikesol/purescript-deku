module Deku.DOM.Attr.Y2 where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Y2 = Y2
instance Attr Line_ Y2  String  where
  attr Y2 value = unsafeAttribute (  { key: "y2", value: prop' value  } <$ _)
instance Attr Line_ Y2 (Event.Event Unit -> Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y2", value: prop' value })) eventValue)
instance Attr Line_ Y2 (Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y2", value: prop' value }
instance Attr LinearGradient_ Y2  String  where
  attr Y2 value = unsafeAttribute (  { key: "y2", value: prop' value  } <$ _)
instance Attr LinearGradient_ Y2 (Event.Event Unit -> Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "y2", value: prop' value })) eventValue)
instance Attr LinearGradient_ Y2 (Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "y2", value: prop' value }
instance Attr everything Y2  Unit  where
  attr Y2 _ = unsafeAttribute (  { key: "y2", value: unset'  } <$ _)
instance Attr everything Y2 (Event.Event Unit -> Event.Event  Unit ) where
  attr Y2 eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "y2", value: unset' })) eventValue)
instance Attr everything Y2 (Event.Event  Unit ) where
  attr Y2 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "y2", value: unset' }