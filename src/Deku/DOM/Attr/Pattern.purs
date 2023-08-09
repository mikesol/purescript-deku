module Deku.DOM.Attr.Pattern where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Pattern = Pattern
instance Attr Input_ Pattern  String  where
  attr Pattern value = unsafeAttribute (  
    { key: "pattern", value: prop' value  } <$ _)
instance Attr Input_ Pattern (Event.Event Unit -> Event.Event  String ) where
  attr Pattern eventValue = unsafeAttribute (map (map (
    \value -> { key: "pattern", value: prop' value })) eventValue)
instance Attr Input_ Pattern (Event.Event  String ) where
  attr Pattern eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pattern", value: prop' value }
instance Attr everything Pattern  Unit  where
  attr Pattern _ = unsafeAttribute (  { key: "pattern", value: unset'  } <$ _)
instance Attr everything Pattern (Event.Event Unit -> Event.Event  Unit ) where
  attr Pattern eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "pattern", value: unset' })) eventValue)
instance Attr everything Pattern (Event.Event  Unit ) where
  attr Pattern eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "pattern", value: unset' }