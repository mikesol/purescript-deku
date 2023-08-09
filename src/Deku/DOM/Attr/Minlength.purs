module Deku.DOM.Attr.Minlength where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Minlength = Minlength
instance Attr Input_ Minlength  String  where
  attr Minlength value = unsafeAttribute (  
    { key: "minlength", value: prop' value  } <$ _)
instance Attr Input_ Minlength (Event.Event Unit -> Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute (map (map (
    \value -> { key: "minlength", value: prop' value })) eventValue)
instance Attr Input_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "minlength", value: prop' value }
instance Attr Textarea_ Minlength  String  where
  attr Minlength value = unsafeAttribute (  
    { key: "minlength", value: prop' value  } <$ _)
instance Attr Textarea_ Minlength (Event.Event Unit -> Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute (map (map (
    \value -> { key: "minlength", value: prop' value })) eventValue)
instance Attr Textarea_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "minlength", value: prop' value }
instance Attr everything Minlength  Unit  where
  attr Minlength _ = unsafeAttribute (  
    { key: "minlength", value: unset'  } <$ _)
instance Attr everything Minlength (Event.Event Unit -> Event.Event  Unit ) where
  attr Minlength eventValue = unsafeAttribute (map (map (
    \_ -> { key: "minlength", value: unset' })) eventValue)
instance Attr everything Minlength (Event.Event  Unit ) where
  attr Minlength eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "minlength", value: unset' }