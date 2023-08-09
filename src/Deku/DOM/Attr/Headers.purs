module Deku.DOM.Attr.Headers where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Headers = Headers
instance Attr Td_ Headers  String  where
  attr Headers value = unsafeAttribute (  
    { key: "headers", value: prop' value  } <$ _)
instance Attr Td_ Headers (Event.Event Unit -> Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute (map (map (
    \value -> { key: "headers", value: prop' value })) eventValue)
instance Attr Td_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "headers", value: prop' value }
instance Attr Th_ Headers  String  where
  attr Headers value = unsafeAttribute (  
    { key: "headers", value: prop' value  } <$ _)
instance Attr Th_ Headers (Event.Event Unit -> Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute (map (map (
    \value -> { key: "headers", value: prop' value })) eventValue)
instance Attr Th_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "headers", value: prop' value }
instance Attr everything Headers  Unit  where
  attr Headers _ = unsafeAttribute (  { key: "headers", value: unset'  } <$ _)
instance Attr everything Headers (Event.Event Unit -> Event.Event  Unit ) where
  attr Headers eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "headers", value: unset' })) eventValue)
instance Attr everything Headers (Event.Event  Unit ) where
  attr Headers eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "headers", value: unset' }