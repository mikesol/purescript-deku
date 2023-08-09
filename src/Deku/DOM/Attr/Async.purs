module Deku.DOM.Attr.Async where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Async = Async
instance Attr Script_ Async  String  where
  attr Async value = unsafeAttribute (  
    { key: "async", value: prop' value  } <$ _)
instance Attr Script_ Async (Event.Event Unit -> Event.Event  String ) where
  attr Async eventValue = unsafeAttribute (map (map (
    \value -> { key: "async", value: prop' value })) eventValue)
instance Attr Script_ Async (Event.Event  String ) where
  attr Async eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "async", value: prop' value }
instance Attr everything Async  Unit  where
  attr Async _ = unsafeAttribute (  { key: "async", value: unset'  } <$ _)
instance Attr everything Async (Event.Event Unit -> Event.Event  Unit ) where
  attr Async eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "async", value: unset' })) eventValue)
instance Attr everything Async (Event.Event  Unit ) where
  attr Async eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "async", value: unset' }