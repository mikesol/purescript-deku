module Deku.DOM.Attr.Size where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Size = Size
instance Attr Input_ Size  String  where
  attr Size value = unsafeAttribute (  
    { key: "size", value: prop' value  } <$ _)
instance Attr Input_ Size (Event.Event Unit -> Event.Event  String ) where
  attr Size eventValue = unsafeAttribute (map (map ( \value ->
    { key: "size", value: prop' value })) eventValue)
instance Attr Input_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "size", value: prop' value }
instance Attr Select_ Size  String  where
  attr Size value = unsafeAttribute (  
    { key: "size", value: prop' value  } <$ _)
instance Attr Select_ Size (Event.Event Unit -> Event.Event  String ) where
  attr Size eventValue = unsafeAttribute (map (map ( \value ->
    { key: "size", value: prop' value })) eventValue)
instance Attr Select_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "size", value: prop' value }
instance Attr everything Size  Unit  where
  attr Size _ = unsafeAttribute (  { key: "size", value: unset'  } <$ _)
instance Attr everything Size (Event.Event Unit -> Event.Event  Unit ) where
  attr Size eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "size", value: unset' })) eventValue)
instance Attr everything Size (Event.Event  Unit ) where
  attr Size eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "size", value: unset' }