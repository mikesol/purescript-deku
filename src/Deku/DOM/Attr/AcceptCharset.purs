module Deku.DOM.Attr.AcceptCharset where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data AcceptCharset = AcceptCharset
instance Attr Form_ AcceptCharset  String  where
  attr AcceptCharset value = unsafeAttribute (  
    { key: "accept-charset", value: prop' value  } <$ _)
instance Attr Form_ AcceptCharset (Event.Event Unit -> Event.Event  String ) where
  attr AcceptCharset eventValue = unsafeAttribute (map (map (
    \value -> { key: "accept-charset", value: prop' value })) eventValue)
instance Attr Form_ AcceptCharset (Event.Event  String ) where
  attr AcceptCharset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "accept-charset", value: prop' value }
instance Attr everything AcceptCharset  Unit  where
  attr AcceptCharset _ = unsafeAttribute (  
    { key: "accept-charset", value: unset'  } <$ _)
instance Attr everything AcceptCharset (Event.Event Unit -> Event.Event  Unit ) where
  attr AcceptCharset eventValue = unsafeAttribute (map (map (
    \_ -> { key: "accept-charset", value: unset' })) eventValue)
instance Attr everything AcceptCharset (Event.Event  Unit ) where
  attr AcceptCharset eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "accept-charset", value: unset' }