module Deku.DOM.Attr.Language where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Language = Language
instance Attr Script_ Language  String  where
  attr Language value = unsafeAttribute (  
    { key: "language", value: prop' value  } <$ _)
instance Attr Script_ Language (Event.Event Unit -> Event.Event  String ) where
  attr Language eventValue = unsafeAttribute (map (map (
    \value -> { key: "language", value: prop' value })) eventValue)
instance Attr Script_ Language (Event.Event  String ) where
  attr Language eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "language", value: prop' value }
instance Attr everything Language  Unit  where
  attr Language _ = unsafeAttribute (  
    { key: "language", value: unset'  } <$ _)
instance Attr everything Language (Event.Event Unit -> Event.Event  Unit ) where
  attr Language eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "language", value: unset' })) eventValue)
instance Attr everything Language (Event.Event  Unit ) where
  attr Language eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "language", value: unset' }