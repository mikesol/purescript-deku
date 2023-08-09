module Deku.DOM.Attr.Formtarget where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Formtarget = Formtarget
instance Attr Button_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute (  
    { key: "formtarget", value: prop' value  } <$ _)
instance Attr Button_ Formtarget (Event.Event Unit -> Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute (map (map (
    \value -> { key: "formtarget", value: prop' value })) eventValue)
instance Attr Button_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formtarget", value: prop' value }
instance Attr Input_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute (  
    { key: "formtarget", value: prop' value  } <$ _)
instance Attr Input_ Formtarget (Event.Event Unit -> Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute (map (map (
    \value -> { key: "formtarget", value: prop' value })) eventValue)
instance Attr Input_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formtarget", value: prop' value }
instance Attr everything Formtarget  Unit  where
  attr Formtarget _ = unsafeAttribute (  
    { key: "formtarget", value: unset'  } <$ _)
instance Attr everything Formtarget (Event.Event Unit -> Event.Event  Unit ) where
  attr Formtarget eventValue = unsafeAttribute (map (map (
    \_ -> { key: "formtarget", value: unset' })) eventValue)
instance Attr everything Formtarget (Event.Event  Unit ) where
  attr Formtarget eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "formtarget", value: unset' }