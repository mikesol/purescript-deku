module Deku.DOM.Attr.Charset where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Charset = Charset
instance Attr Meta_ Charset  String  where
  attr Charset value = unsafeAttribute (  
    { key: "charset", value: prop' value  } <$ _)
instance Attr Meta_ Charset (Event.Event Unit -> Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute (map (map (
    \value -> { key: "charset", value: prop' value })) eventValue)
instance Attr Meta_ Charset (Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "charset", value: prop' value }
instance Attr Script_ Charset  String  where
  attr Charset value = unsafeAttribute (  
    { key: "charset", value: prop' value  } <$ _)
instance Attr Script_ Charset (Event.Event Unit -> Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute (map (map (
    \value -> { key: "charset", value: prop' value })) eventValue)
instance Attr Script_ Charset (Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "charset", value: prop' value }
instance Attr everything Charset  Unit  where
  attr Charset _ = unsafeAttribute (  { key: "charset", value: unset'  } <$ _)
instance Attr everything Charset (Event.Event Unit -> Event.Event  Unit ) where
  attr Charset eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "charset", value: unset' })) eventValue)
instance Attr everything Charset (Event.Event  Unit ) where
  attr Charset eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "charset", value: unset' }