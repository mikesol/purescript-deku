module Deku.DOM.Attr.Action where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Action = Action
instance Attr Form_ Action  String  where
  attr Action value = unsafeAttribute (  
    { key: "action", value: prop' value  } <$ _)
instance Attr Form_ Action (Event.Event Unit -> Event.Event  String ) where
  attr Action eventValue = unsafeAttribute (map (map (
    \value -> { key: "action", value: prop' value })) eventValue)
instance Attr Form_ Action (Event.Event  String ) where
  attr Action eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "action", value: prop' value }
instance Attr everything Action  Unit  where
  attr Action _ = unsafeAttribute (  { key: "action", value: unset'  } <$ _)
instance Attr everything Action (Event.Event Unit -> Event.Event  Unit ) where
  attr Action eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "action", value: unset' })) eventValue)
instance Attr everything Action (Event.Event  Unit ) where
  attr Action eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "action", value: unset' }