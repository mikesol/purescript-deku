module Deku.DOM.Attr.List where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data List = List
instance Attr Input_ List  String  where
  attr List value = unsafeAttribute (  
    { key: "list", value: prop' value  } <$ _)
instance Attr Input_ List (Event.Event Unit -> Event.Event  String ) where
  attr List eventValue = unsafeAttribute (map (map ( \value ->
    { key: "list", value: prop' value })) eventValue)
instance Attr Input_ List (Event.Event  String ) where
  attr List eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "list", value: prop' value }
instance Attr everything List  Unit  where
  attr List _ = unsafeAttribute (  { key: "list", value: unset'  } <$ _)
instance Attr everything List (Event.Event Unit -> Event.Event  Unit ) where
  attr List eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "list", value: unset' })) eventValue)
instance Attr everything List (Event.Event  Unit ) where
  attr List eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "list", value: unset' }