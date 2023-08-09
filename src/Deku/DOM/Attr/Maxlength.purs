module Deku.DOM.Attr.Maxlength where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Maxlength = Maxlength
instance Attr Input_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute (  
    { key: "maxlength", value: prop' value  } <$ _)
instance Attr Input_ Maxlength (Event.Event Unit -> Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute (map (map (
    \value -> { key: "maxlength", value: prop' value })) eventValue)
instance Attr Input_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "maxlength", value: prop' value }
instance Attr Textarea_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute (  
    { key: "maxlength", value: prop' value  } <$ _)
instance Attr Textarea_ Maxlength (Event.Event Unit -> Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute (map (map (
    \value -> { key: "maxlength", value: prop' value })) eventValue)
instance Attr Textarea_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "maxlength", value: prop' value }
instance Attr everything Maxlength  Unit  where
  attr Maxlength _ = unsafeAttribute (  
    { key: "maxlength", value: unset'  } <$ _)
instance Attr everything Maxlength (Event.Event Unit -> Event.Event  Unit ) where
  attr Maxlength eventValue = unsafeAttribute (map (map (
    \_ -> { key: "maxlength", value: unset' })) eventValue)
instance Attr everything Maxlength (Event.Event  Unit ) where
  attr Maxlength eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "maxlength", value: unset' }