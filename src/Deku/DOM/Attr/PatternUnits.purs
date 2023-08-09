module Deku.DOM.Attr.PatternUnits where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data PatternUnits = PatternUnits
instance Attr Pattern_ PatternUnits  String  where
  attr PatternUnits value = unsafeAttribute (  
    { key: "patternUnits", value: prop' value  } <$ _)
instance Attr Pattern_ PatternUnits (Event.Event Unit -> Event.Event  String ) where
  attr PatternUnits eventValue = unsafeAttribute (map (map (
    \value -> { key: "patternUnits", value: prop' value })) eventValue)
instance Attr Pattern_ PatternUnits (Event.Event  String ) where
  attr PatternUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "patternUnits", value: prop' value }
instance Attr everything PatternUnits  Unit  where
  attr PatternUnits _ = unsafeAttribute (  
    { key: "patternUnits", value: unset'  } <$ _)
instance Attr everything PatternUnits (Event.Event Unit -> Event.Event  Unit ) where
  attr PatternUnits eventValue = unsafeAttribute (map (map (
    \_ -> { key: "patternUnits", value: unset' })) eventValue)
instance Attr everything PatternUnits (Event.Event  Unit ) where
  attr PatternUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "patternUnits", value: unset' }