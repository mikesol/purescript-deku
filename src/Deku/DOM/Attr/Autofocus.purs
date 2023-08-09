module Deku.DOM.Attr.Autofocus where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Autofocus = Autofocus
instance Attr Button_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute (  
    { key: "autofocus", value: prop' value  } <$ _)
instance Attr Button_ Autofocus (Event.Event Unit -> Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute (map (map (
    \value -> { key: "autofocus", value: prop' value })) eventValue)
instance Attr Button_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autofocus", value: prop' value }
instance Attr Input_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute (  
    { key: "autofocus", value: prop' value  } <$ _)
instance Attr Input_ Autofocus (Event.Event Unit -> Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute (map (map (
    \value -> { key: "autofocus", value: prop' value })) eventValue)
instance Attr Input_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autofocus", value: prop' value }
instance Attr Select_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute (  
    { key: "autofocus", value: prop' value  } <$ _)
instance Attr Select_ Autofocus (Event.Event Unit -> Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute (map (map (
    \value -> { key: "autofocus", value: prop' value })) eventValue)
instance Attr Select_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autofocus", value: prop' value }
instance Attr Textarea_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute (  
    { key: "autofocus", value: prop' value  } <$ _)
instance Attr Textarea_ Autofocus (Event.Event Unit -> Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute (map (map (
    \value -> { key: "autofocus", value: prop' value })) eventValue)
instance Attr Textarea_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autofocus", value: prop' value }
instance Attr everything Autofocus  Unit  where
  attr Autofocus _ = unsafeAttribute (  
    { key: "autofocus", value: unset'  } <$ _)
instance Attr everything Autofocus (Event.Event Unit -> Event.Event  Unit ) where
  attr Autofocus eventValue = unsafeAttribute (map (map (
    \_ -> { key: "autofocus", value: unset' })) eventValue)
instance Attr everything Autofocus (Event.Event  Unit ) where
  attr Autofocus eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "autofocus", value: unset' }