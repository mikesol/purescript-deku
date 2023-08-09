module Deku.DOM.Attr.BaseProfile where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data BaseProfile = BaseProfile
instance Attr Svg_ BaseProfile  String  where
  attr BaseProfile value = unsafeAttribute (  
    { key: "baseProfile", value: prop' value  } <$ _)
instance Attr Svg_ BaseProfile (Event.Event Unit -> Event.Event  String ) where
  attr BaseProfile eventValue = unsafeAttribute (map (map (
    \value -> { key: "baseProfile", value: prop' value })) eventValue)
instance Attr Svg_ BaseProfile (Event.Event  String ) where
  attr BaseProfile eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "baseProfile", value: prop' value }
instance Attr everything BaseProfile  Unit  where
  attr BaseProfile _ = unsafeAttribute (  
    { key: "baseProfile", value: unset'  } <$ _)
instance Attr everything BaseProfile (Event.Event Unit -> Event.Event  Unit ) where
  attr BaseProfile eventValue = unsafeAttribute (map (map (
    \_ -> { key: "baseProfile", value: unset' })) eventValue)
instance Attr everything BaseProfile (Event.Event  Unit ) where
  attr BaseProfile eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "baseProfile", value: unset' }