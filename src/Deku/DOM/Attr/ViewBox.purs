module Deku.DOM.Attr.ViewBox where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data ViewBox = ViewBox
instance Attr Marker_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute (  
    { key: "viewBox", value: prop' value  } <$ _)
instance Attr Marker_ ViewBox (Event.Event Unit -> Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute (map (map (
    \value -> { key: "viewBox", value: prop' value })) eventValue)
instance Attr Marker_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "viewBox", value: prop' value }
instance Attr Pattern_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute (  
    { key: "viewBox", value: prop' value  } <$ _)
instance Attr Pattern_ ViewBox (Event.Event Unit -> Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute (map (map (
    \value -> { key: "viewBox", value: prop' value })) eventValue)
instance Attr Pattern_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "viewBox", value: prop' value }
instance Attr Svg_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute (  
    { key: "viewBox", value: prop' value  } <$ _)
instance Attr Svg_ ViewBox (Event.Event Unit -> Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute (map (map (
    \value -> { key: "viewBox", value: prop' value })) eventValue)
instance Attr Svg_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "viewBox", value: prop' value }
instance Attr Symbol_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute (  
    { key: "viewBox", value: prop' value  } <$ _)
instance Attr Symbol_ ViewBox (Event.Event Unit -> Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute (map (map (
    \value -> { key: "viewBox", value: prop' value })) eventValue)
instance Attr Symbol_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "viewBox", value: prop' value }
instance Attr View_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute (  
    { key: "viewBox", value: prop' value  } <$ _)
instance Attr View_ ViewBox (Event.Event Unit -> Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute (map (map (
    \value -> { key: "viewBox", value: prop' value })) eventValue)
instance Attr View_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "viewBox", value: prop' value }
instance Attr everything ViewBox  Unit  where
  attr ViewBox _ = unsafeAttribute (  { key: "viewBox", value: unset'  } <$ _)
instance Attr everything ViewBox (Event.Event Unit -> Event.Event  Unit ) where
  attr ViewBox eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "viewBox", value: unset' })) eventValue)
instance Attr everything ViewBox (Event.Event  Unit ) where
  attr ViewBox eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "viewBox", value: unset' }