module Deku.DOM.Attr.Open where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Open = Open
instance Attr Details_ Open  String  where
  attr Open value = unsafeAttribute (  
    { key: "open", value: prop' value  } <$ _)
instance Attr Details_ Open (Event.Event Unit -> Event.Event  String ) where
  attr Open eventValue = unsafeAttribute (map (map ( \value ->
    { key: "open", value: prop' value })) eventValue)
instance Attr Details_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "open", value: prop' value }
instance Attr Dialog_ Open  String  where
  attr Open value = unsafeAttribute (  
    { key: "open", value: prop' value  } <$ _)
instance Attr Dialog_ Open (Event.Event Unit -> Event.Event  String ) where
  attr Open eventValue = unsafeAttribute (map (map ( \value ->
    { key: "open", value: prop' value })) eventValue)
instance Attr Dialog_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "open", value: prop' value }
instance Attr everything Open  Unit  where
  attr Open _ = unsafeAttribute (  { key: "open", value: unset'  } <$ _)
instance Attr everything Open (Event.Event Unit -> Event.Event  Unit ) where
  attr Open eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "open", value: unset' })) eventValue)
instance Attr everything Open (Event.Event  Unit ) where
  attr Open eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "open", value: unset' }