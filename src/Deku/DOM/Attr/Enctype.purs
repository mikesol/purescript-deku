module Deku.DOM.Attr.Enctype where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Enctype = Enctype
instance Attr Form_ Enctype  String  where
  attr Enctype value = unsafeAttribute (  
    { key: "enctype", value: prop' value  } <$ _)
instance Attr Form_ Enctype (Event.Event Unit -> Event.Event  String ) where
  attr Enctype eventValue = unsafeAttribute (map (map (
    \value -> { key: "enctype", value: prop' value })) eventValue)
instance Attr Form_ Enctype (Event.Event  String ) where
  attr Enctype eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "enctype", value: prop' value }
instance Attr everything Enctype  Unit  where
  attr Enctype _ = unsafeAttribute (  { key: "enctype", value: unset'  } <$ _)
instance Attr everything Enctype (Event.Event Unit -> Event.Event  Unit ) where
  attr Enctype eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "enctype", value: unset' })) eventValue)
instance Attr everything Enctype (Event.Event  Unit ) where
  attr Enctype eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "enctype", value: unset' }