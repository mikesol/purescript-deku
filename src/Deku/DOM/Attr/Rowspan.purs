module Deku.DOM.Attr.Rowspan where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Rowspan = Rowspan
instance Attr Td_ Rowspan  String  where
  attr Rowspan value = unsafeAttribute (  
    { key: "rowspan", value: prop' value  } <$ _)
instance Attr Td_ Rowspan (Event.Event Unit -> Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "rowspan", value: prop' value })) eventValue)
instance Attr Td_ Rowspan (Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "rowspan", value: prop' value }
instance Attr Th_ Rowspan  String  where
  attr Rowspan value = unsafeAttribute (  
    { key: "rowspan", value: prop' value  } <$ _)
instance Attr Th_ Rowspan (Event.Event Unit -> Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "rowspan", value: prop' value })) eventValue)
instance Attr Th_ Rowspan (Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "rowspan", value: prop' value }
instance Attr everything Rowspan  Unit  where
  attr Rowspan _ = unsafeAttribute (  { key: "rowspan", value: unset'  } <$ _)
instance Attr everything Rowspan (Event.Event Unit -> Event.Event  Unit ) where
  attr Rowspan eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "rowspan", value: unset' })) eventValue)
instance Attr everything Rowspan (Event.Event  Unit ) where
  attr Rowspan eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "rowspan", value: unset' }