module Deku.DOM.Attr.Enterkeyhint where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Enterkeyhint = Enterkeyhint
instance Attr Textarea_ Enterkeyhint  String  where
  attr Enterkeyhint value = unsafeAttribute (  
    { key: "enterkeyhint", value: prop' value  } <$ _)
instance Attr Textarea_ Enterkeyhint (Event.Event Unit -> Event.Event  String ) where
  attr Enterkeyhint eventValue = unsafeAttribute (map (map (
    \value -> { key: "enterkeyhint", value: prop' value })) eventValue)
instance Attr Textarea_ Enterkeyhint (Event.Event  String ) where
  attr Enterkeyhint eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "enterkeyhint", value: prop' value }
instance Attr everything Enterkeyhint  Unit  where
  attr Enterkeyhint _ = unsafeAttribute (  
    { key: "enterkeyhint", value: unset'  } <$ _)
instance Attr everything Enterkeyhint (Event.Event Unit -> Event.Event  Unit ) where
  attr Enterkeyhint eventValue = unsafeAttribute (map (map (
    \_ -> { key: "enterkeyhint", value: unset' })) eventValue)
instance Attr everything Enterkeyhint (Event.Event  Unit ) where
  attr Enterkeyhint eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "enterkeyhint", value: unset' }