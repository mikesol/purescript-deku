module Deku.DOM.Attr.ContentScriptType where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data ContentScriptType = ContentScriptType
instance Attr Svg_ ContentScriptType  String  where
  attr ContentScriptType value = unsafeAttribute (  
    { key: "contentScriptType", value: prop' value  } <$ _)
instance Attr Svg_ ContentScriptType (Event.Event Unit -> Event.Event  String ) where
  attr ContentScriptType eventValue = unsafeAttribute (map (map ( \value -> { key: "contentScriptType", value: prop' value })) eventValue)
instance Attr Svg_ ContentScriptType (Event.Event  String ) where
  attr ContentScriptType eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contentScriptType", value: prop' value }
instance Attr everything ContentScriptType  Unit  where
  attr ContentScriptType _ = unsafeAttribute (  
    { key: "contentScriptType", value: unset'  } <$ _)
instance Attr everything ContentScriptType (Event.Event Unit -> Event.Event  Unit ) where
  attr ContentScriptType eventValue = unsafeAttribute (map (map ( \_ -> { key: "contentScriptType", value: unset' })) eventValue)
instance Attr everything ContentScriptType (Event.Event  Unit ) where
  attr ContentScriptType eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "contentScriptType", value: unset' }