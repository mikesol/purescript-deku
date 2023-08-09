module Deku.DOM.Attr.Border where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Border = Border
instance Attr Img_ Border  String  where
  attr Border value = unsafeAttribute (  
    { key: "border", value: prop' value  } <$ _)
instance Attr Img_ Border (Event.Event Unit -> Event.Event  String ) where
  attr Border eventValue = unsafeAttribute (map (map (
    \value -> { key: "border", value: prop' value })) eventValue)
instance Attr Img_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "border", value: prop' value }
instance Attr Object_ Border  String  where
  attr Border value = unsafeAttribute (  
    { key: "border", value: prop' value  } <$ _)
instance Attr Object_ Border (Event.Event Unit -> Event.Event  String ) where
  attr Border eventValue = unsafeAttribute (map (map (
    \value -> { key: "border", value: prop' value })) eventValue)
instance Attr Object_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "border", value: prop' value }
instance Attr Table_ Border  String  where
  attr Border value = unsafeAttribute (  
    { key: "border", value: prop' value  } <$ _)
instance Attr Table_ Border (Event.Event Unit -> Event.Event  String ) where
  attr Border eventValue = unsafeAttribute (map (map (
    \value -> { key: "border", value: prop' value })) eventValue)
instance Attr Table_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "border", value: prop' value }
instance Attr everything Border  Unit  where
  attr Border _ = unsafeAttribute (  { key: "border", value: unset'  } <$ _)
instance Attr everything Border (Event.Event Unit -> Event.Event  Unit ) where
  attr Border eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "border", value: unset' })) eventValue)
instance Attr everything Border (Event.Event  Unit ) where
  attr Border eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "border", value: unset' }