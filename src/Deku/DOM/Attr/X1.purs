module Deku.DOM.Attr.X1 where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data X1 = X1
instance Attr Line_ X1  String  where
  attr X1 value = unsafeAttribute (  { key: "x1", value: prop' value  } <$ _)
instance Attr Line_ X1 (Event.Event Unit -> Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "x1", value: prop' value })) eventValue)
instance Attr Line_ X1 (Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "x1", value: prop' value }
instance Attr LinearGradient_ X1  String  where
  attr X1 value = unsafeAttribute (  { key: "x1", value: prop' value  } <$ _)
instance Attr LinearGradient_ X1 (Event.Event Unit -> Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "x1", value: prop' value })) eventValue)
instance Attr LinearGradient_ X1 (Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "x1", value: prop' value }
instance Attr everything X1  Unit  where
  attr X1 _ = unsafeAttribute (  { key: "x1", value: unset'  } <$ _)
instance Attr everything X1 (Event.Event Unit -> Event.Event  Unit ) where
  attr X1 eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "x1", value: unset' })) eventValue)
instance Attr everything X1 (Event.Event  Unit ) where
  attr X1 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "x1", value: unset' }