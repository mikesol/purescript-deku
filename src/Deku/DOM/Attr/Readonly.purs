module Deku.DOM.Attr.Readonly where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Readonly = Readonly
instance Attr Input_ Readonly  String  where
  attr Readonly value = unsafeAttribute (  
    { key: "readonly", value: prop' value  } <$ _)
instance Attr Input_ Readonly (Event.Event Unit -> Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "readonly", value: prop' value })) eventValue)
instance Attr Input_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "readonly", value: prop' value }
instance Attr Textarea_ Readonly  String  where
  attr Readonly value = unsafeAttribute (  
    { key: "readonly", value: prop' value  } <$ _)
instance Attr Textarea_ Readonly (Event.Event Unit -> Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "readonly", value: prop' value })) eventValue)
instance Attr Textarea_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "readonly", value: prop' value }
instance Attr everything Readonly  Unit  where
  attr Readonly _ = unsafeAttribute (  
    { key: "readonly", value: unset'  } <$ _)
instance Attr everything Readonly (Event.Event Unit -> Event.Event  Unit ) where
  attr Readonly eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "readonly", value: unset' })) eventValue)
instance Attr everything Readonly (Event.Event  Unit ) where
  attr Readonly eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "readonly", value: unset' }