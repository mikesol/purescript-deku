module Deku.DOM.Attr.Data where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Data = Data
instance Attr Object_ Data  String  where
  attr Data value = unsafeAttribute (  
    { key: "data", value: prop' value  } <$ _)
instance Attr Object_ Data (Event.Event Unit -> Event.Event  String ) where
  attr Data eventValue = unsafeAttribute (map (map ( \value ->
    { key: "data", value: prop' value })) eventValue)
instance Attr Object_ Data (Event.Event  String ) where
  attr Data eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "data", value: prop' value }
instance Attr everything Data  Unit  where
  attr Data _ = unsafeAttribute (  { key: "data", value: unset'  } <$ _)
instance Attr everything Data (Event.Event Unit -> Event.Event  Unit ) where
  attr Data eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "data", value: unset' })) eventValue)
instance Attr everything Data (Event.Event  Unit ) where
  attr Data eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "data", value: unset' }