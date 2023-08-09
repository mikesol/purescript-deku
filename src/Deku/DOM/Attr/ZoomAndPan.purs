module Deku.DOM.Attr.ZoomAndPan where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data ZoomAndPan = ZoomAndPan
instance Attr View_ ZoomAndPan  String  where
  attr ZoomAndPan value = unsafeAttribute (  
    { key: "zoomAndPan", value: prop' value  } <$ _)
instance Attr View_ ZoomAndPan (Event.Event Unit -> Event.Event  String ) where
  attr ZoomAndPan eventValue = unsafeAttribute (map (map (
    \value -> { key: "zoomAndPan", value: prop' value })) eventValue)
instance Attr View_ ZoomAndPan (Event.Event  String ) where
  attr ZoomAndPan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "zoomAndPan", value: prop' value }
instance Attr everything ZoomAndPan  Unit  where
  attr ZoomAndPan _ = unsafeAttribute (  
    { key: "zoomAndPan", value: unset'  } <$ _)
instance Attr everything ZoomAndPan (Event.Event Unit -> Event.Event  Unit ) where
  attr ZoomAndPan eventValue = unsafeAttribute (map (map (
    \_ -> { key: "zoomAndPan", value: unset' })) eventValue)
instance Attr everything ZoomAndPan (Event.Event  Unit ) where
  attr ZoomAndPan eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "zoomAndPan", value: unset' }