module Deku.DOM.Attr.Required where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Required = Required
instance Attr Input_ Required  String  where
  attr Required value = unsafeAttribute (  
    { key: "required", value: prop' value  } <$ _)
instance Attr Input_ Required (Event.Event Unit -> Event.Event  String ) where
  attr Required eventValue = unsafeAttribute (map (map (
    \value -> { key: "required", value: prop' value })) eventValue)
instance Attr Input_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "required", value: prop' value }
instance Attr Select_ Required  String  where
  attr Required value = unsafeAttribute (  
    { key: "required", value: prop' value  } <$ _)
instance Attr Select_ Required (Event.Event Unit -> Event.Event  String ) where
  attr Required eventValue = unsafeAttribute (map (map (
    \value -> { key: "required", value: prop' value })) eventValue)
instance Attr Select_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "required", value: prop' value }
instance Attr Textarea_ Required  String  where
  attr Required value = unsafeAttribute (  
    { key: "required", value: prop' value  } <$ _)
instance Attr Textarea_ Required (Event.Event Unit -> Event.Event  String ) where
  attr Required eventValue = unsafeAttribute (map (map (
    \value -> { key: "required", value: prop' value })) eventValue)
instance Attr Textarea_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "required", value: prop' value }
instance Attr everything Required  Unit  where
  attr Required _ = unsafeAttribute (  
    { key: "required", value: unset'  } <$ _)
instance Attr everything Required (Event.Event Unit -> Event.Event  Unit ) where
  attr Required eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "required", value: unset' })) eventValue)
instance Attr everything Required (Event.Event  Unit ) where
  attr Required eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "required", value: unset' }