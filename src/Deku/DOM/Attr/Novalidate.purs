module Deku.DOM.Attr.Novalidate where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Novalidate = Novalidate
instance Attr Form_ Novalidate  String  where
  attr Novalidate value = unsafeAttribute (  
    { key: "novalidate", value: prop' value  } <$ _)
instance Attr Form_ Novalidate (Event.Event Unit -> Event.Event  String ) where
  attr Novalidate eventValue = unsafeAttribute (map (map (
    \value -> { key: "novalidate", value: prop' value })) eventValue)
instance Attr Form_ Novalidate (Event.Event  String ) where
  attr Novalidate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "novalidate", value: prop' value }
instance Attr everything Novalidate  Unit  where
  attr Novalidate _ = unsafeAttribute (  
    { key: "novalidate", value: unset'  } <$ _)
instance Attr everything Novalidate (Event.Event Unit -> Event.Event  Unit ) where
  attr Novalidate eventValue = unsafeAttribute (map (map (
    \_ -> { key: "novalidate", value: unset' })) eventValue)
instance Attr everything Novalidate (Event.Event  Unit ) where
  attr Novalidate eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "novalidate", value: unset' }