module Deku.DOM.Attr.TextLength where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data TextLength = TextLength
instance Attr Text_ TextLength  String  where
  attr TextLength value = unsafeAttribute (  
    { key: "textLength", value: prop' value  } <$ _)
instance Attr Text_ TextLength (Event.Event Unit -> Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "textLength", value: prop' value })) eventValue)
instance Attr Text_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "textLength", value: prop' value }
instance Attr TextPath_ TextLength  String  where
  attr TextLength value = unsafeAttribute (  
    { key: "textLength", value: prop' value  } <$ _)
instance Attr TextPath_ TextLength (Event.Event Unit -> Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "textLength", value: prop' value })) eventValue)
instance Attr TextPath_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "textLength", value: prop' value }
instance Attr Tspan_ TextLength  String  where
  attr TextLength value = unsafeAttribute (  
    { key: "textLength", value: prop' value  } <$ _)
instance Attr Tspan_ TextLength (Event.Event Unit -> Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "textLength", value: prop' value })) eventValue)
instance Attr Tspan_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "textLength", value: prop' value }
instance Attr everything TextLength  Unit  where
  attr TextLength _ = unsafeAttribute (  
    { key: "textLength", value: unset'  } <$ _)
instance Attr everything TextLength (Event.Event Unit -> Event.Event  Unit ) where
  attr TextLength eventValue = unsafeAttribute (map (map (
    \_ -> { key: "textLength", value: unset' })) eventValue)
instance Attr everything TextLength (Event.Event  Unit ) where
  attr TextLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "textLength", value: unset' }