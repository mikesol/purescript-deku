module Deku.DOM.Attr.Bgcolor where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Bgcolor = Bgcolor
instance Attr Body_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Body_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Body_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Col_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Col_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Col_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Colgroup_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Colgroup_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Colgroup_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Table_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Table_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Table_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Tbody_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Tbody_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Tbody_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Tfoot_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Tfoot_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Tfoot_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Td_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Td_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Td_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Th_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Th_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Th_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr Tr_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute (  
    { key: "bgcolor", value: prop' value  } <$ _)
instance Attr Tr_ Bgcolor (Event.Event Unit -> Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map (
    \value -> { key: "bgcolor", value: prop' value })) eventValue)
instance Attr Tr_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }
instance Attr everything Bgcolor  Unit  where
  attr Bgcolor _ = unsafeAttribute (  { key: "bgcolor", value: unset'  } <$ _)
instance Attr everything Bgcolor (Event.Event Unit -> Event.Event  Unit ) where
  attr Bgcolor eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "bgcolor", value: unset' })) eventValue)
instance Attr everything Bgcolor (Event.Event  Unit ) where
  attr Bgcolor eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "bgcolor", value: unset' }