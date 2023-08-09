module Deku.DOM.Attr.High where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data High = High
instance Attr Meter_ High  String  where
  attr High value = unsafeAttribute (  
    { key: "high", value: prop' value  } <$ _)
instance Attr Meter_ High (Event.Event Unit -> Event.Event  String ) where
  attr High eventValue = unsafeAttribute (map (map ( \value ->
    { key: "high", value: prop' value })) eventValue)
instance Attr Meter_ High (Event.Event  String ) where
  attr High eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "high", value: prop' value }
instance Attr everything High  Unit  where
  attr High _ = unsafeAttribute (  { key: "high", value: unset'  } <$ _)
instance Attr everything High (Event.Event Unit -> Event.Event  Unit ) where
  attr High eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "high", value: unset' })) eventValue)
instance Attr everything High (Event.Event  Unit ) where
  attr High eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "high", value: unset' }