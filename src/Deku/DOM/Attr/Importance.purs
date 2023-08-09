module Deku.DOM.Attr.Importance where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Importance = Importance
instance Attr Iframe_ Importance  String  where
  attr Importance value = unsafeAttribute (  
    { key: "importance", value: prop' value  } <$ _)
instance Attr Iframe_ Importance (Event.Event Unit -> Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute (map (map (
    \value -> { key: "importance", value: prop' value })) eventValue)
instance Attr Iframe_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "importance", value: prop' value }
instance Attr Img_ Importance  String  where
  attr Importance value = unsafeAttribute (  
    { key: "importance", value: prop' value  } <$ _)
instance Attr Img_ Importance (Event.Event Unit -> Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute (map (map (
    \value -> { key: "importance", value: prop' value })) eventValue)
instance Attr Img_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "importance", value: prop' value }
instance Attr Link_ Importance  String  where
  attr Importance value = unsafeAttribute (  
    { key: "importance", value: prop' value  } <$ _)
instance Attr Link_ Importance (Event.Event Unit -> Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute (map (map (
    \value -> { key: "importance", value: prop' value })) eventValue)
instance Attr Link_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "importance", value: prop' value }
instance Attr Script_ Importance  String  where
  attr Importance value = unsafeAttribute (  
    { key: "importance", value: prop' value  } <$ _)
instance Attr Script_ Importance (Event.Event Unit -> Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute (map (map (
    \value -> { key: "importance", value: prop' value })) eventValue)
instance Attr Script_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "importance", value: prop' value }
instance Attr everything Importance  Unit  where
  attr Importance _ = unsafeAttribute (  
    { key: "importance", value: unset'  } <$ _)
instance Attr everything Importance (Event.Event Unit -> Event.Event  Unit ) where
  attr Importance eventValue = unsafeAttribute (map (map (
    \_ -> { key: "importance", value: unset' })) eventValue)
instance Attr everything Importance (Event.Event  Unit ) where
  attr Importance eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "importance", value: unset' }