module Deku.DOM.Attr.KeyPoints where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data KeyPoints = KeyPoints
instance Attr AnimateMotion_ KeyPoints  String  where
  attr KeyPoints value = unsafeAttribute (  
    { key: "keyPoints", value: prop' value  } <$ _)
instance Attr AnimateMotion_ KeyPoints (Event.Event Unit -> Event.Event  String ) where
  attr KeyPoints eventValue = unsafeAttribute (map (map (
    \value -> { key: "keyPoints", value: prop' value })) eventValue)
instance Attr AnimateMotion_ KeyPoints (Event.Event  String ) where
  attr KeyPoints eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "keyPoints", value: prop' value }
instance Attr everything KeyPoints  Unit  where
  attr KeyPoints _ = unsafeAttribute (  
    { key: "keyPoints", value: unset'  } <$ _)
instance Attr everything KeyPoints (Event.Event Unit -> Event.Event  Unit ) where
  attr KeyPoints eventValue = unsafeAttribute (map (map (
    \_ -> { key: "keyPoints", value: unset' })) eventValue)
instance Attr everything KeyPoints (Event.Event  Unit ) where
  attr KeyPoints eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "keyPoints", value: unset' }