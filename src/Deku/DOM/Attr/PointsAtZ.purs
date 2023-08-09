module Deku.DOM.Attr.PointsAtZ where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data PointsAtZ = PointsAtZ
instance Attr FeSpotLight_ PointsAtZ  String  where
  attr PointsAtZ value = unsafeAttribute (  
    { key: "pointsAtZ", value: prop' value  } <$ _)
instance Attr FeSpotLight_ PointsAtZ (Event.Event Unit -> Event.Event  String ) where
  attr PointsAtZ eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointsAtZ", value: prop' value })) eventValue)
instance Attr FeSpotLight_ PointsAtZ (Event.Event  String ) where
  attr PointsAtZ eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointsAtZ", value: prop' value }
instance Attr everything PointsAtZ  Unit  where
  attr PointsAtZ _ = unsafeAttribute (  
    { key: "pointsAtZ", value: unset'  } <$ _)
instance Attr everything PointsAtZ (Event.Event Unit -> Event.Event  Unit ) where
  attr PointsAtZ eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pointsAtZ", value: unset' })) eventValue)
instance Attr everything PointsAtZ (Event.Event  Unit ) where
  attr PointsAtZ eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointsAtZ", value: unset' }