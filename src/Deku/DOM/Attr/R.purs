module Deku.DOM.Attr.R where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data R = R
instance Attr Circle_ R  String  where
  attr R value = unsafeAttribute (  { key: "r", value: prop' value  } <$ _)
instance Attr Circle_ R (Event.Event Unit -> Event.Event  String ) where
  attr R eventValue = unsafeAttribute (map (map ( \value ->
    { key: "r", value: prop' value })) eventValue)
instance Attr Circle_ R (Event.Event  String ) where
  attr R eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "r", value: prop' value }
instance Attr RadialGradient_ R  String  where
  attr R value = unsafeAttribute (  { key: "r", value: prop' value  } <$ _)
instance Attr RadialGradient_ R (Event.Event Unit -> Event.Event  String ) where
  attr R eventValue = unsafeAttribute (map (map ( \value ->
    { key: "r", value: prop' value })) eventValue)
instance Attr RadialGradient_ R (Event.Event  String ) where
  attr R eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "r", value: prop' value }
instance Attr everything R  Unit  where
  attr R _ = unsafeAttribute (  { key: "r", value: unset'  } <$ _)
instance Attr everything R (Event.Event Unit -> Event.Event  Unit ) where
  attr R eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "r", value: unset' })) eventValue)
instance Attr everything R (Event.Event  Unit ) where
  attr R eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "r", value: unset' }