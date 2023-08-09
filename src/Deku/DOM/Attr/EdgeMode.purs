module Deku.DOM.Attr.EdgeMode where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data EdgeMode = EdgeMode
instance Attr FeConvolveMatrix_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute (  
    { key: "edgeMode", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ EdgeMode (Event.Event Unit -> Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "edgeMode", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }
instance Attr FeGaussianBlur_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute (  
    { key: "edgeMode", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ EdgeMode (Event.Event Unit -> Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "edgeMode", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }
instance Attr everything EdgeMode  Unit  where
  attr EdgeMode _ = unsafeAttribute (  
    { key: "edgeMode", value: unset'  } <$ _)
instance Attr everything EdgeMode (Event.Event Unit -> Event.Event  Unit ) where
  attr EdgeMode eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "edgeMode", value: unset' })) eventValue)
instance Attr everything EdgeMode (Event.Event  Unit ) where
  attr EdgeMode eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "edgeMode", value: unset' }