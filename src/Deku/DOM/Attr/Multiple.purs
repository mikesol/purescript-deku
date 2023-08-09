module Deku.DOM.Attr.Multiple where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Multiple = Multiple
instance Attr Input_ Multiple  String  where
  attr Multiple value = unsafeAttribute (  
    { key: "multiple", value: prop' value  } <$ _)
instance Attr Input_ Multiple (Event.Event Unit -> Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute (map (map (
    \value -> { key: "multiple", value: prop' value })) eventValue)
instance Attr Input_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "multiple", value: prop' value }
instance Attr Select_ Multiple  String  where
  attr Multiple value = unsafeAttribute (  
    { key: "multiple", value: prop' value  } <$ _)
instance Attr Select_ Multiple (Event.Event Unit -> Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute (map (map (
    \value -> { key: "multiple", value: prop' value })) eventValue)
instance Attr Select_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "multiple", value: prop' value }
instance Attr everything Multiple  Unit  where
  attr Multiple _ = unsafeAttribute (  
    { key: "multiple", value: unset'  } <$ _)
instance Attr everything Multiple (Event.Event Unit -> Event.Event  Unit ) where
  attr Multiple eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "multiple", value: unset' })) eventValue)
instance Attr everything Multiple (Event.Event  Unit ) where
  attr Multiple eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "multiple", value: unset' }