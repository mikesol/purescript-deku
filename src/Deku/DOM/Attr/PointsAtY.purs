module Deku.DOM.Attr.PointsAtY where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data PointsAtY = PointsAtY
instance Attr FeSpotLight_ PointsAtY  String  where
  attr PointsAtY value = unsafeAttribute (  
    { key: "pointsAtY", value: prop' value  } <$ _)
instance Attr FeSpotLight_ PointsAtY (Event.Event Unit -> Event.Event  String ) where
  attr PointsAtY eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointsAtY", value: prop' value })) eventValue)
instance Attr FeSpotLight_ PointsAtY (Event.Event  String ) where
  attr PointsAtY eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointsAtY", value: prop' value }
instance Attr everything PointsAtY  Unit  where
  attr PointsAtY _ = unsafeAttribute (  
    { key: "pointsAtY", value: unset'  } <$ _)
instance Attr everything PointsAtY (Event.Event Unit -> Event.Event  Unit ) where
  attr PointsAtY eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pointsAtY", value: unset' })) eventValue)
instance Attr everything PointsAtY (Event.Event  Unit ) where
  attr PointsAtY eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointsAtY", value: unset' }