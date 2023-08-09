module Deku.DOM.Attr.Selected where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Option (Option_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Selected = Selected
instance Attr Option_ Selected  String  where
  attr Selected value = unsafeAttribute (  
    { key: "selected", value: prop' value  } <$ _)
instance Attr Option_ Selected (Event.Event Unit -> Event.Event  String ) where
  attr Selected eventValue = unsafeAttribute (map (map (
    \value -> { key: "selected", value: prop' value })) eventValue)
instance Attr Option_ Selected (Event.Event  String ) where
  attr Selected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "selected", value: prop' value }
instance Attr everything Selected  Unit  where
  attr Selected _ = unsafeAttribute (  
    { key: "selected", value: unset'  } <$ _)
instance Attr everything Selected (Event.Event Unit -> Event.Event  Unit ) where
  attr Selected eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "selected", value: unset' })) eventValue)
instance Attr everything Selected (Event.Event  Unit ) where
  attr Selected eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "selected", value: unset' }