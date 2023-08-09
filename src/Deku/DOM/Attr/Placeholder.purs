module Deku.DOM.Attr.Placeholder where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Placeholder = Placeholder
instance Attr Input_ Placeholder  String  where
  attr Placeholder value = unsafeAttribute (  
    { key: "placeholder", value: prop' value  } <$ _)
instance Attr Input_ Placeholder (Event.Event Unit -> Event.Event  String ) where
  attr Placeholder eventValue = unsafeAttribute (map (map (
    \value -> { key: "placeholder", value: prop' value })) eventValue)
instance Attr Input_ Placeholder (Event.Event  String ) where
  attr Placeholder eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "placeholder", value: prop' value }
instance Attr Textarea_ Placeholder  String  where
  attr Placeholder value = unsafeAttribute (  
    { key: "placeholder", value: prop' value  } <$ _)
instance Attr Textarea_ Placeholder (Event.Event Unit -> Event.Event  String ) where
  attr Placeholder eventValue = unsafeAttribute (map (map (
    \value -> { key: "placeholder", value: prop' value })) eventValue)
instance Attr Textarea_ Placeholder (Event.Event  String ) where
  attr Placeholder eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "placeholder", value: prop' value }
instance Attr everything Placeholder  Unit  where
  attr Placeholder _ = unsafeAttribute (  
    { key: "placeholder", value: unset'  } <$ _)
instance Attr everything Placeholder (Event.Event Unit -> Event.Event  Unit ) where
  attr Placeholder eventValue = unsafeAttribute (map (map (
    \_ -> { key: "placeholder", value: unset' })) eventValue)
instance Attr everything Placeholder (Event.Event  Unit ) where
  attr Placeholder eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "placeholder", value: unset' }