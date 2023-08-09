module Deku.DOM.Attr.Checked where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Checked = Checked
instance Attr Input_ Checked  String  where
  attr Checked value = unsafeAttribute (  
    { key: "checked", value: prop' value  } <$ _)
instance Attr Input_ Checked (Event.Event Unit -> Event.Event  String ) where
  attr Checked eventValue = unsafeAttribute (map (map (
    \value -> { key: "checked", value: prop' value })) eventValue)
instance Attr Input_ Checked (Event.Event  String ) where
  attr Checked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "checked", value: prop' value }
instance Attr everything Checked  Unit  where
  attr Checked _ = unsafeAttribute (  { key: "checked", value: unset'  } <$ _)
instance Attr everything Checked (Event.Event Unit -> Event.Event  Unit ) where
  attr Checked eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "checked", value: unset' })) eventValue)
instance Attr everything Checked (Event.Event  Unit ) where
  attr Checked eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "checked", value: unset' }