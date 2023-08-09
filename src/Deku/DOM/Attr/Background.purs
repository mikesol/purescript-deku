module Deku.DOM.Attr.Background where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Background = Background
instance Attr Body_ Background  String  where
  attr Background value = unsafeAttribute (  
    { key: "background", value: prop' value  } <$ _)
instance Attr Body_ Background (Event.Event Unit -> Event.Event  String ) where
  attr Background eventValue = unsafeAttribute (map (map (
    \value -> { key: "background", value: prop' value })) eventValue)
instance Attr Body_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "background", value: prop' value }
instance Attr Table_ Background  String  where
  attr Background value = unsafeAttribute (  
    { key: "background", value: prop' value  } <$ _)
instance Attr Table_ Background (Event.Event Unit -> Event.Event  String ) where
  attr Background eventValue = unsafeAttribute (map (map (
    \value -> { key: "background", value: prop' value })) eventValue)
instance Attr Table_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "background", value: prop' value }
instance Attr Td_ Background  String  where
  attr Background value = unsafeAttribute (  
    { key: "background", value: prop' value  } <$ _)
instance Attr Td_ Background (Event.Event Unit -> Event.Event  String ) where
  attr Background eventValue = unsafeAttribute (map (map (
    \value -> { key: "background", value: prop' value })) eventValue)
instance Attr Td_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "background", value: prop' value }
instance Attr Th_ Background  String  where
  attr Background value = unsafeAttribute (  
    { key: "background", value: prop' value  } <$ _)
instance Attr Th_ Background (Event.Event Unit -> Event.Event  String ) where
  attr Background eventValue = unsafeAttribute (map (map (
    \value -> { key: "background", value: prop' value })) eventValue)
instance Attr Th_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "background", value: prop' value }
instance Attr everything Background  Unit  where
  attr Background _ = unsafeAttribute (  
    { key: "background", value: unset'  } <$ _)
instance Attr everything Background (Event.Event Unit -> Event.Event  Unit ) where
  attr Background eventValue = unsafeAttribute (map (map (
    \_ -> { key: "background", value: unset' })) eventValue)
instance Attr everything Background (Event.Event  Unit ) where
  attr Background eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "background", value: unset' }