module Deku.DOM.Attr.Usemap where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Usemap = Usemap
instance Attr Img_ Usemap  String  where
  attr Usemap value = unsafeAttribute (  
    { key: "usemap", value: prop' value  } <$ _)
instance Attr Img_ Usemap (Event.Event Unit -> Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute (map (map (
    \value -> { key: "usemap", value: prop' value })) eventValue)
instance Attr Img_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "usemap", value: prop' value }
instance Attr Input_ Usemap  String  where
  attr Usemap value = unsafeAttribute (  
    { key: "usemap", value: prop' value  } <$ _)
instance Attr Input_ Usemap (Event.Event Unit -> Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute (map (map (
    \value -> { key: "usemap", value: prop' value })) eventValue)
instance Attr Input_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "usemap", value: prop' value }
instance Attr Object_ Usemap  String  where
  attr Usemap value = unsafeAttribute (  
    { key: "usemap", value: prop' value  } <$ _)
instance Attr Object_ Usemap (Event.Event Unit -> Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute (map (map (
    \value -> { key: "usemap", value: prop' value })) eventValue)
instance Attr Object_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "usemap", value: prop' value }
instance Attr everything Usemap  Unit  where
  attr Usemap _ = unsafeAttribute (  { key: "usemap", value: unset'  } <$ _)
instance Attr everything Usemap (Event.Event Unit -> Event.Event  Unit ) where
  attr Usemap eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "usemap", value: unset' })) eventValue)
instance Attr everything Usemap (Event.Event  Unit ) where
  attr Usemap eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "usemap", value: unset' }