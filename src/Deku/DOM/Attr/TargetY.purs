module Deku.DOM.Attr.TargetY where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data TargetY = TargetY
instance Attr FeConvolveMatrix_ TargetY  String  where
  attr TargetY value = unsafeAttribute (  
    { key: "targetY", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ TargetY (Event.Event Unit -> Event.Event  String ) where
  attr TargetY eventValue = unsafeAttribute (map (map (
    \value -> { key: "targetY", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ TargetY (Event.Event  String ) where
  attr TargetY eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "targetY", value: prop' value }
instance Attr everything TargetY  Unit  where
  attr TargetY _ = unsafeAttribute (  { key: "targetY", value: unset'  } <$ _)
instance Attr everything TargetY (Event.Event Unit -> Event.Event  Unit ) where
  attr TargetY eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "targetY", value: unset' })) eventValue)
instance Attr everything TargetY (Event.Event  Unit ) where
  attr TargetY eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "targetY", value: unset' }