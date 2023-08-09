module Deku.DOM.Attr.YChannelSelector where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data YChannelSelector = YChannelSelector
instance Attr FeDisplacementMap_ YChannelSelector  String  where
  attr YChannelSelector value = unsafeAttribute (  
    { key: "yChannelSelector", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ YChannelSelector (Event.Event Unit -> Event.Event  String ) where
  attr YChannelSelector eventValue = unsafeAttribute (map (map ( \value -> { key: "yChannelSelector", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ YChannelSelector (Event.Event  String ) where
  attr YChannelSelector eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "yChannelSelector", value: prop' value }
instance Attr everything YChannelSelector  Unit  where
  attr YChannelSelector _ = unsafeAttribute (  
    { key: "yChannelSelector", value: unset'  } <$ _)
instance Attr everything YChannelSelector (Event.Event Unit -> Event.Event  Unit ) where
  attr YChannelSelector eventValue = unsafeAttribute (map (map ( \_ -> { key: "yChannelSelector", value: unset' })) eventValue)
instance Attr everything YChannelSelector (Event.Event  Unit ) where
  attr YChannelSelector eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "yChannelSelector", value: unset' }