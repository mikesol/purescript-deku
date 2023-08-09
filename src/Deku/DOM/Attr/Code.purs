module Deku.DOM.Attr.Code where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Code = Code
instance Attr Applet_ Code  String  where
  attr Code value = unsafeAttribute (  
    { key: "code", value: prop' value  } <$ _)
instance Attr Applet_ Code (Event.Event Unit -> Event.Event  String ) where
  attr Code eventValue = unsafeAttribute (map (map ( \value ->
    { key: "code", value: prop' value })) eventValue)
instance Attr Applet_ Code (Event.Event  String ) where
  attr Code eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "code", value: prop' value }
instance Attr everything Code  Unit  where
  attr Code _ = unsafeAttribute (  { key: "code", value: unset'  } <$ _)
instance Attr everything Code (Event.Event Unit -> Event.Event  Unit ) where
  attr Code eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "code", value: unset' })) eventValue)
instance Attr everything Code (Event.Event  Unit ) where
  attr Code eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "code", value: unset' }