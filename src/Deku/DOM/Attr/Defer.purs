module Deku.DOM.Attr.Defer where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Defer = Defer
instance Attr Script_ Defer  String  where
  attr Defer value = unsafeAttribute (  
    { key: "defer", value: prop' value  } <$ _)
instance Attr Script_ Defer (Event.Event Unit -> Event.Event  String ) where
  attr Defer eventValue = unsafeAttribute (map (map (
    \value -> { key: "defer", value: prop' value })) eventValue)
instance Attr Script_ Defer (Event.Event  String ) where
  attr Defer eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "defer", value: prop' value }
instance Attr everything Defer  Unit  where
  attr Defer _ = unsafeAttribute (  { key: "defer", value: unset'  } <$ _)
instance Attr everything Defer (Event.Event Unit -> Event.Event  Unit ) where
  attr Defer eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "defer", value: unset' })) eventValue)
instance Attr everything Defer (Event.Event  Unit ) where
  attr Defer eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "defer", value: unset' }