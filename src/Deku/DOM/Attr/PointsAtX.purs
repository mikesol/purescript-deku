module Deku.DOM.Attr.PointsAtX where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data PointsAtX = PointsAtX
instance Attr FeSpotLight_ PointsAtX  String  where
  attr PointsAtX value = unsafeAttribute (  
    { key: "pointsAtX", value: prop' value  } <$ _)
instance Attr FeSpotLight_ PointsAtX (Event.Event Unit -> Event.Event  String ) where
  attr PointsAtX eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointsAtX", value: prop' value })) eventValue)
instance Attr FeSpotLight_ PointsAtX (Event.Event  String ) where
  attr PointsAtX eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointsAtX", value: prop' value }
instance Attr everything PointsAtX  Unit  where
  attr PointsAtX _ = unsafeAttribute (  
    { key: "pointsAtX", value: unset'  } <$ _)
instance Attr everything PointsAtX (Event.Event Unit -> Event.Event  Unit ) where
  attr PointsAtX eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pointsAtX", value: unset' })) eventValue)
instance Attr everything PointsAtX (Event.Event  Unit ) where
  attr PointsAtX eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointsAtX", value: unset' }